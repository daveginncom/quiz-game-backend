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

#### POSTGRES_ADMIN_PASSWORD
PostgreSQL admin password (min 8 chars, must include uppercase, lowercase, numbers)

### Required Environment Variables

Set these in the workflow file (`.github/workflows/deploy.yml`):

- `ACR_NAME` - Azure Container Registry name (must be globally unique, alphanumeric only)
- `POSTGRES_SERVER_NAME` - PostgreSQL server name (must be globally unique)
- `POSTGRES_ADMIN_USERNAME` - PostgreSQL admin username (default: `quizadmin`)

These are defined at the top of the workflow file under `env:` and can be customized per environment.

### Setting Up Secrets

```bash
# Navigate to your GitHub repository
# Go to Settings → Secrets and variables → Actions → New repository secret

# Add the secret:
# Name: AZURE_CREDENTIALS
# Value: <paste JSON from service principal creation>

# Name: POSTGRES_ADMIN_PASSWORD
# Value: YourSecurePassword123!
```

### Terraform Backend Configuration

The workflow **automatically creates** the Terraform state storage if it doesn't exist:

- Resource Group: `rg-terraform-state`
- Storage Account: `tfstatequizapp`
- Container: `tfstate`
- State File: `quiz-app.tfstate`

**No manual setup required!** On the first run, the workflow will:
1. Check if the storage account exists
2. Create it if needed (including resource group and container)
3. Retrieve the access key securely
4. Use it for Terraform state management

The backend configuration is already in `infra/main.tf`:
```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstatequizapp"
    container_name       = "tfstate"
    key                  = "quiz-app.tfstate"
  }
}
```

**Customization:** To use different names, update the environment variables in `.github/workflows/deploy.yml`:
```yaml
env:
  TF_STATE_RESOURCE_GROUP: 'rg-terraform-state'
  TF_STATE_STORAGE_ACCOUNT: 'tfstatequizapp'  # Must be globally unique
  TF_STATE_CONTAINER: 'tfstate'
  TF_STATE_KEY: 'quiz-app.tfstate'
```

**Manual Setup (Optional):** If you prefer to create the storage account manually before the first workflow run:
```bash
# Create resource group for Terraform state
az group create --name rg-terraform-state --location westus

# Create storage account
az storage account create \
  --name tfstatequizapp \
  --resource-group rg-terraform-state \
  --location westus \
  --sku Standard_LRS

# Create container
az storage container create \
  --name tfstate \
  --account-name tfstatequizapp
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

The workflow uses these environment variables (configured in `.github/workflows/deploy.yml`):
- `JAVA_VERSION`: '21'
- `JAVA_DISTRIBUTION`: 'temurin'
- `ACR_NAME`: Azure Container Registry name
- `POSTGRES_SERVER_NAME`: PostgreSQL server name
- `POSTGRES_ADMIN_USERNAME`: PostgreSQL admin username
- `TF_STATE_RESOURCE_GROUP`: Terraform state resource group
- `TF_STATE_STORAGE_ACCOUNT`: Terraform state storage account
- `TF_STATE_CONTAINER`: Terraform state container
- `TF_STATE_KEY`: Terraform state file name

### Troubleshooting

**Issue: Terraform state storage creation fails**
- Solution: Ensure service principal has contributor access to create resource groups
- Check storage account name is globally unique (alphanumeric only, 3-24 chars)

**Issue: Terraform state conflicts**
- Solution: Remote backend is configured automatically - conflicts should be rare

**Issue: Database migration fails**
- Solution: Check firewall rules allow GitHub Actions runner IP
- The workflow automatically adds/removes firewall rules

**Issue: Container app deployment timeout**
- Solution: Check Container App logs in Azure Portal
- Verify database connection string is correct

**Issue: Docker build fails**
- Solution: Check Maven build succeeds locally
- Verify Dockerfile is in `quizapp/` directory

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
