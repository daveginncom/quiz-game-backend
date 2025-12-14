# Infrastructure as Code

This directory contains Terraform configuration for deploying the Quiz App to Azure.

## Architecture

- **Azure Container Registry**: Stores the Docker image
- **Azure Database for PostgreSQL Flexible Server**: Managed PostgreSQL database
- **Azure Key Vault**: Secure secret storage with RBAC authorization
- **Azure Container Apps**: Hosts the containerized Java application with managed identity
- **Azure Log Analytics**: Monitoring and logging

### Security Architecture
- **Auto-Generated Passwords**: Terraform generates secure 32-character passwords
- **Managed Identity**: Container App uses system-assigned identity to access Key Vault
- **Zero-Knowledge**: No human ever knows the database password
- See [KEY_VAULT_IMPLEMENTATION.md](../KEY_VAULT_IMPLEMENTATION.md) for details

## Prerequisites

1. [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed
2. [Terraform](https://www.terraform.io/downloads.html) installed (>= 1.0)
3. Azure subscription

## Setup

1. **Login to Azure**:
   ```bash
   az login
   ```

2. **Set your subscription** (if you have multiple):
   ```bash
   az account set --subscription "Your Subscription Name"
   ```

3. **Create terraform.tfvars** (optional):
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
   
   Edit `terraform.tfvars` and update the values, especially:
   - `acr_name`: Must be globally unique (alphanumeric only, 5-50 chars)
   - `postgres_server_name`: Must be globally unique
   - `key_vault_name`: Must be globally unique (3-24 chars, alphanumeric and hyphens)
   
   **Note**: PostgreSQL password is **auto-generated** by Terraform - no manual input needed!

4. **Initialize Terraform**:
   ```bash
   cd infra
   terraform init
   ```

5. **Review the plan**:
   ```bash
   terraform plan
   ```

6. **Apply the configuration**:
   ```bash
   terraform apply
   ```
   Type `yes` when prompted.

## Build and Deploy Application

After Terraform creates the infrastructure:

1. **Login to ACR**:
   ```bash
   az acr login --name $(terraform output -raw acr_login_server | cut -d'.' -f1)
   ```

2. **Build and push Docker image** (from project root):
   ```bash
   cd ../quizapp
   
   # Build the application
   ./mvnw clean package -DskipTests
   
   # Build Docker image
   docker build -t quiz-app:latest .
   
   # Tag for ACR
   ACR_LOGIN_SERVER=$(cd ../infra && terraform output -raw acr_login_server)
   docker tag quiz-app:latest $ACR_LOGIN_SERVER/quiz-app:latest
   
   # Push to ACR
   docker push $ACR_LOGIN_SERVER/quiz-app:latest
   ```

3. **Update Container App** (trigger new revision):
   ```bash
   cd ../infra
   terraform apply -replace=azurerm_container_app.main
   ```

4. **Get the application URL**:
   ```bash
   terraform output container_app_url
   ```

## Accessing the Database

To connect to the PostgreSQL database from your local machine:

```bash
# Get connection details
POSTGRES_FQDN=$(terraform output -raw postgres_fqdn)
POSTGRES_DB=$(terraform output -raw postgres_database_name)

# Connect using psql
psql "host=$POSTGRES_FQDN port=5432 dbname=$POSTGRES_DB user=quizadmin sslmode=require"
```

## Viewing Logs

```bash
# Get Container App name
CONTAINER_APP_NAME=$(terraform output -raw container_app_name | cut -d'/' -f9)
RESOURCE_GROUP=$(terraform output -raw resource_group_name)

# View logs
az containerapp logs show \
  --name $CONTAINER_APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --follow
```

## Scaling

The Container App is configured to scale between 1-3 replicas automatically based on HTTP traffic.

To manually adjust:
- Edit `min_replicas` and `max_replicas` in `main.tf`
- Run `terraform apply`

## Updating the Application

1. Make code changes
2. Rebuild and push the Docker image (steps above)
3. Update the container app: `terraform apply -replace=azurerm_container_app.main`

Or update the `app_image_tag` variable to use versioned tags:
```bash
terraform apply -var="app_image_tag=v1.0.1"
```

## Cleanup

To destroy all resources:

```bash
terraform destroy
```

Type `yes` when prompted.

## Cost Considerations

Approximate monthly costs (as of 2025):
- Azure Container Registry (Basic): ~$5/month
- PostgreSQL Flexible Server (B1ms): ~$12/month
- Container Apps: Pay-per-use (typically $5-20/month for low traffic)
- Log Analytics: First 5GB free, then ~$2.30/GB

Total: ~$25-40/month for a small application

## Security Notes

- **Auto-Generated Passwords**: 32-character passwords created by Terraform's `random_password` provider
- **Azure Key Vault**: All secrets stored in Key Vault with RBAC authorization
- **Managed Identity**: Container App uses system-assigned identity (no credentials in code)
- **Zero-Knowledge**: Database password never known to humans
- **SSL Required**: PostgreSQL connections enforce SSL/TLS
- **RBAC**: Key Vault access controlled via Azure role assignments
- **Audit Logging**: All Key Vault access logged to Azure Monitor
- **Firewall Rules**: Azure services only (restrict further for production if needed)

See [KEY_VAULT_IMPLEMENTATION.md](../KEY_VAULT_IMPLEMENTATION.md) for complete security architecture.
