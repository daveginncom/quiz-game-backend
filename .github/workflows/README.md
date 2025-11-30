# GitHub Actions Workflows

## Deploy to Azure Workflow

This workflow automatically deploys the application to Azure when code is pushed to the `main` branch.

### Workflow Steps

1. **Deploy Infrastructure** - Uses Terraform to create/update Azure resources
2. **Build and Push Docker Image** - Builds the Java app and pushes to Azure Container Registry
3. **Run Database Migrations** - Executes Flyway migrations against Azure PostgreSQL
4. **Deploy Container App** - Updates the Container App with the new image

### Required GitHub Secrets

Set these secrets in your GitHub repository (Settings → Secrets and variables → Actions):

#### AZURE_CREDENTIALS
Azure Service Principal credentials in JSON format:

```bash
# Create a service principal
az ad sp create-for-rbac \
  --name "github-actions-quiz-app" \
  --role contributor \
  --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} \
  --sdk-auth
```

Copy the entire JSON output and save it as the `AZURE_CREDENTIALS` secret.

#### Other Required Secrets

- `POSTGRES_ADMIN_PASSWORD` - PostgreSQL admin password (min 8 chars, must include uppercase, lowercase, numbers)
- `POSTGRES_ADMIN_USERNAME` - PostgreSQL admin username (default: `quizadmin`)
- `ACR_NAME` - Azure Container Registry name (must be globally unique, alphanumeric only)
- `POSTGRES_SERVER_NAME` - PostgreSQL server name (must be globally unique)

### Setting Up Secrets

```bash
# Navigate to your GitHub repository
# Go to Settings → Secrets and variables → Actions → New repository secret

# Add each secret:
# Name: AZURE_CREDENTIALS
# Value: <paste JSON from service principal creation>

# Name: POSTGRES_ADMIN_PASSWORD
# Value: YourSecurePassword123!

# Name: POSTGRES_ADMIN_USERNAME
# Value: quizadmin

# Name: ACR_NAME
# Value: acrquizapp123

# Name: POSTGRES_SERVER_NAME
# Value: psql-quiz-app-123
```

### Terraform Backend Configuration

For production, configure a remote backend for Terraform state:

1. **Create an Azure Storage Account**:
```bash
# Create resource group for Terraform state
az group create --name rg-terraform-state --location eastus

# Create storage account
az storage account create \
  --name tfstatequizapp \
  --resource-group rg-terraform-state \
  --location eastus \
  --sku Standard_LRS

# Create container
az storage container create \
  --name tfstate \
  --account-name tfstatequizapp
```

2. **Update `infra/main.tf`** to include backend configuration:
```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstatequizapp"
    container_name       = "tfstate"
    key                  = "quiz-app.tfstate"
  }
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
```

3. **Add storage access secrets** to GitHub:
```bash
# Get storage account key
az storage account keys list \
  --resource-group rg-terraform-state \
  --account-name tfstatequizapp \
  --query '[0].value' \
  --output tsv
```

Add as secret `ARM_ACCESS_KEY` and update the workflow to include:
```yaml
env:
  ARM_ACCESS_KEY: ${{ secrets.ARM_ACCESS_KEY }}
```

### Manual Trigger

You can manually trigger the workflow:
1. Go to Actions tab in GitHub
2. Select "Deploy to Azure" workflow
3. Click "Run workflow"
4. Select branch and click "Run workflow"

### Monitoring Deployments

- **View logs**: Actions tab → Select workflow run
- **View resources**: Azure Portal → Resource Group `rg-quiz-app`
- **View application**: Output will show the deployed URL

### Environment Variables

The workflow uses these environment variables:
- `JAVA_VERSION`: '21'
- `JAVA_DISTRIBUTION`: 'temurin'

### Troubleshooting

**Issue: Terraform state conflicts**
- Solution: Use remote backend (see above) or ensure only one workflow runs at a time

**Issue: Database migration fails**
- Solution: Check firewall rules allow GitHub Actions runner IP
- The workflow automatically adds/removes firewall rules

**Issue: Container app deployment timeout**
- Solution: Check Container App logs in Azure Portal
- Verify database connection string is correct

**Issue: Docker build fails**
- Solution: Check Maven build succeeds locally
- Verify Dockerfile is in `myapp/` directory

### Security Best Practices

1. **Use managed identities** instead of admin credentials in production
2. **Restrict firewall rules** - Don't use 0.0.0.0 for production
3. **Rotate secrets regularly**
4. **Use separate environments** - Create dev/staging/prod workflows
5. **Enable branch protection** - Require pull request reviews before merge to main

### Cost Optimization

- Workflow runs are free on public repositories
- Azure resources cost ~$25-40/month
- Consider destroying resources when not in use:
  ```bash
  cd infra
  terraform destroy -auto-approve
  ```
