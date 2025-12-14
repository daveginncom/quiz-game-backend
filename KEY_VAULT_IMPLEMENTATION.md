# Azure Key Vault Implementation with Managed Identity

## Overview
This implementation adds Azure Key Vault integration to the quiz application using System-Assigned Managed Identity for secure secrets management. No secrets are stored in the application code or configuration files.

## Architecture

### Security Model
- **System-Assigned Managed Identity**: Container App authenticates to Key Vault without credentials
- **RBAC-Based Access**: Using Azure role assignments instead of access policies
- **Zero Secrets in Code**: All sensitive values retrieved from Key Vault at runtime

### Components Modified

#### 1. Spring Boot Application (`quizapp/`)

**pom.xml**
- Added `spring-cloud-azure.version` property: `5.18.0`
- Added dependency: `spring-cloud-azure-starter-keyvault-secrets`
- Added BOM: `spring-cloud-azure-dependencies` with import scope

**application.properties**
- Added Key Vault configuration with `spring.cloud.azure.keyvault.secret.property-source-enabled=false`
- This allows local development to use local database credentials
- In Azure, environment variables enable Key Vault integration

#### 2. Terraform Infrastructure (`infra/`)

**variables.tf**
- Added `key_vault_name` variable (default: "kv-quiz-app")
- Must be globally unique, 3-24 characters, alphanumeric and hyphens only

**key_vault.tf** (NEW)
```hcl
- data.azurerm_client_config.current: Gets Azure tenant/subscription info
- random_password.postgres_admin: Auto-generates secure 32-character password
  - Includes lowercase, uppercase, numbers, and special characters
  - Never stored in Git or visible to users
- azurerm_key_vault.main: Key Vault with RBAC authorization
  - Soft delete: 7 days retention
  - Network ACLs: Allow Azure Services
  - RBAC enabled (no access policies)
- azurerm_key_vault_secret.postgres_password: Stores auto-generated password
- azurerm_role_assignment.terraform_keyvault_admin: Grants Terraform access
```

**container_app.tf**
- Added `identity { type = "SystemAssigned" }` block
- Removed hardcoded `postgres-password` secret
- Added Key Vault environment variables:
  - `SPRING_CLOUD_AZURE_KEYVAULT_SECRET_PROPERTY_SOURCES_0_ENDPOINT`: Key Vault URI
  - `SPRING_CLOUD_AZURE_KEYVAULT_SECRET_PROPERTY_SOURCES_0_CREDENTIAL_MANAGED_IDENTITY_ENABLED`: "true"
- Changed `SPRING_DATASOURCE_PASSWORD` to: `$${postgres-admin-password}` (Key Vault reference)
- Added `azurerm_role_assignment.container_app_keyvault_secrets_user`: Grants Container App "Key Vault Secrets User" role
- Added `depends_on` for role assignment

**outputs.tf**
- Added `key_vault_name` output
- Added `key_vault_uri` output

#### 3. GitHub Actions (`.github/workflows/deploy.yml`)

**Environment Variables**
- Added `KEY_VAULT_NAME: 'kv-quiz-app'`

**Terraform Steps**
- Added `TF_VAR_key_vault_name` to all Terraform commands
- Updated "Terraform Apply (Infrastructure Only)" to include Key Vault targets:
  - `-target=azurerm_key_vault.main`
  - `-target=azurerm_role_assignment.terraform_keyvault_admin`
  - `-target=azurerm_key_vault_secret.postgres_password`

## Auto-Generated Passwords

### Why Auto-Generate?
Traditional approaches require storing database passwords in GitHub Secrets or manually entering them during deployment. This means:
- Developers/operators know the password
- Password may be shared or leaked
- Rotation requires manual coordination

**Our Solution**: Terraform's `random_password` resource generates a cryptographically secure password that:
- No human ever sees or knows
- Is 32 characters with uppercase, lowercase, numbers, and special characters
- Is automatically stored in Key Vault
- Is used to create the PostgreSQL server
- Can be rotated by destroying and recreating the `random_password` resource

### Password Lifecycle
```
1. terraform plan/apply
   ↓
2. random_password.postgres_admin.result generated (32 chars)
   ↓
3. Password stored in Terraform state (encrypted at rest)
   ↓
4. Password used to create azurerm_postgresql_flexible_server
   ↓
5. Password stored in azurerm_key_vault_secret
   ↓
6. Application retrieves password from Key Vault via managed identity
```

**Important**: The password exists in:
1. Terraform state file (encrypted with Azure Storage encryption)
2. Azure Key Vault (encrypted, access logged)
3. Never in Git, never in GitHub Secrets, never visible to humans

## How It Works

### 1. Infrastructure Deployment
1. Terraform generates secure random password (32 characters with complexity requirements)
2. Terraform creates Key Vault with RBAC enabled
3. Terraform gets "Key Vault Administrator" role to manage secrets
4. Auto-generated password stored in Key Vault as `postgres-admin-password` secret
5. PostgreSQL server created with auto-generated password
6. Container App created with System-Assigned Managed Identity
7. Container App's identity granted "Key Vault Secrets User" role

### 2. Application Runtime
1. Container App starts with managed identity
2. Spring Cloud Azure detects Key Vault environment variables
3. Spring automatically retrieves secrets from Key Vault using managed identity
4. Secret `postgres-admin-password` mapped to `spring.datasource.password`
5. Application connects to database using Key Vault-sourced password

### 3. Secret Reference Syntax
- In environment variables: `$${secret-name}` tells Spring Cloud Azure to fetch from Key Vault
- Spring replaces `$${postgres-admin-password}` with actual secret value at runtime

## Deployment Steps

### Prerequisites
1. Azure subscription with appropriate permissions
2. GitHub secrets configured:
   - `AZURE_CREDENTIALS`: Service principal with Key Vault Administrator access
   - ~~`POSTGRES_ADMIN_PASSWORD`~~: **NOT NEEDED!** Password is auto-generated by Terraform

### Initial Deployment
```bash
# 1. Ensure KEY_VAULT_NAME in workflow is unique
# Edit .github/workflows/deploy.yml if needed

# 2. Push to main branch
git add .
git commit -m "Add Azure Key Vault integration"
git push origin main

# 3. GitHub Actions will:
#    - Run tests
#    - Create infrastructure (including Key Vault)
#    - Build and push Docker image
#    - Run database migrations
#    - Deploy Container App with managed identity
```

### Manual Terraform Deployment
```bash
cd infra

# Initialize Terraform
terraform init

# Plan with Key Vault
terraform plan \
  -var="postgres_admin_password=YourSecurePassword" \
  -var="key_vault_name=kv-quiz-app" \
  -var="acr_name=acrquizapp123" \
  -var="postgres_server_name=psql-quiz-app-123"

# Apply
terraform apply \
  -var="postgres_admin_password=YourSecurePassword" \
  -var="key_vault_name=kv-quiz-app" \
  -var="acr_name=acrquizapp123" \
  -var="postgres_server_name=psql-quiz-app-123"
```

## Security Benefits

### Before (Hardcoded Secrets)
❌ Database password stored in Container App secrets
❌ Visible to anyone with Container App access
❌ Stored in GitHub Secrets (known to developers)
❌ Difficult to rotate without redeployment
❌ No audit trail for secret access

### After (Key Vault + Managed Identity + Auto-Generated Passwords)
✅ **Zero-knowledge secrets**: No human ever knows the database password
✅ Auto-generated 32-character passwords with complexity requirements
✅ No secrets in application code or environment
✅ Managed identity authentication (no credentials to manage)
✅ Centralized secret management
✅ Built-in secret rotation support
✅ Full audit logging of secret access
✅ RBAC-based access control
✅ Azure-managed encryption at rest
✅ Passwords stored only in Terraform state (encrypted) and Key Vault

## Verification

### Check Managed Identity
```bash
# Get Container App identity
az containerapp show \
  --name app-quiz \
  --resource-group rg-quiz-app \
  --query identity
```

### Check Key Vault Access
```bash
# List role assignments for Container App
az role assignment list \
  --scope /subscriptions/<subscription-id>/resourceGroups/rg-quiz-app/providers/Microsoft.KeyVault/vaults/kv-quiz-app-<suffix> \
  --query "[?principalType=='ServicePrincipal']"
```

### Check Application Logs
```bash
# View Container App logs
az containerapp logs show \
  --name app-quiz \
  --resource-group rg-quiz-app \
  --follow

# Look for: "Successfully retrieved secret from Key Vault"
# Should NOT see: Actual password values in logs
```

### Test API
```bash
# Get Container App URL
FQDN=$(az containerapp show \
  --name app-quiz \
  --resource-group rg-quiz-app \
  --query properties.configuration.ingress.fqdn \
  --output tsv)

# Test API endpoint
curl https://$FQDN/api/quizzes
```

## Troubleshooting

### Issue: "Key Vault Access Denied"
**Solution**: 
1. Verify Container App has System-Assigned Identity enabled
2. Check role assignment: Container App needs "Key Vault Secrets User" role
3. Wait 5-10 minutes for role assignment propagation

### Issue: "Secret Not Found"
**Solution**:
1. Verify secret exists: `az keyvault secret show --vault-name kv-quiz-app-<suffix> --name postgres-admin-password`
2. Check secret name matches exactly: `postgres-admin-password`
3. Verify environment variable: `SPRING_DATASOURCE_PASSWORD=$${postgres-admin-password}`

### Issue: "Application Won't Start"
**Solution**:
1. Check Container App logs for Spring Boot startup errors
2. Verify Key Vault environment variables are set correctly
3. Ensure Spring Cloud Azure dependency is in classpath
4. Check Key Vault network access allows Azure Services

## Cost Implications

### Azure Key Vault Pricing (Standard Tier)
- Secret operations: $0.03 per 10,000 transactions
- Secrets stored: First 10,000 secrets included
- Typical monthly cost: < $1 for this application

### No Additional Costs
- Managed Identity: Free
- Role Assignments: Free
- Key Vault in same region as app: No egress charges

## Best Practices Implemented

1. ✅ **Least Privilege**: Container App only has "Secrets User" role (read-only)
2. ✅ **Separation of Concerns**: Terraform has "Administrator" role, app has "User" role
3. ✅ **Soft Delete Enabled**: 7-day retention for accidental deletions
4. ✅ **RBAC Over Access Policies**: Modern Azure security model
5. ✅ **Environment-Specific Config**: Local dev uses local secrets, Azure uses Key Vault
6. ✅ **Audit Trail**: All Key Vault access logged to Azure Monitor
7. ✅ **Secure by Default**: Network ACLs allow only Azure Services

## Future Enhancements

### Secret Rotation
```bash
# Azure Key Vault supports automatic secret rotation
# Can configure rotation policy for postgres password
az keyvault secret set-attributes \
  --vault-name kv-quiz-app-<suffix> \
  --name postgres-admin-password \
  --expires "2024-12-31"
```

### Multiple Environments
- Create separate Key Vaults for dev/staging/prod
- Use Terraform workspaces or separate state files
- Configure environment-specific variable values

### Additional Secrets
```hcl
# Add more secrets to key_vault.tf
resource "azurerm_key_vault_secret" "api_key" {
  name         = "external-api-key"
  value        = var.external_api_key
  key_vault_id = azurerm_key_vault.main.id
  depends_on   = [azurerm_role_assignment.terraform_keyvault_admin]
}
```

### Network Lockdown
```hcl
# Restrict Key Vault to specific networks
network_acls {
  bypass         = "AzureServices"
  default_action = "Deny"
  ip_rules       = ["203.0.113.0/24"]  # Your IP range
}
```

## References

- [Spring Cloud Azure Key Vault Secrets](https://learn.microsoft.com/en-us/azure/developer/java/spring-framework/configure-spring-boot-starter-java-app-with-azure-key-vault)
- [Azure Managed Identity](https://learn.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview)
- [Key Vault RBAC Guide](https://learn.microsoft.com/en-us/azure/key-vault/general/rbac-guide)
- [Container Apps Managed Identity](https://learn.microsoft.com/en-us/azure/container-apps/managed-identity)
