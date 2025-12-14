# Data source to get current Azure client configuration
data "azurerm_client_config" "current" {}

# Generate a random password for PostgreSQL
resource "random_password" "postgres_admin" {
  length           = 32
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
}

# Azure Key Vault
resource "azurerm_key_vault" "main" {
  name                       = var.key_vault_name
  location                   = azurerm_resource_group.main.location
  resource_group_name        = azurerm_resource_group.main.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = false

  # Enable RBAC authorization instead of access policies
  enable_rbac_authorization = true

  network_acls {
    bypass         = "AzureServices"
    default_action = "Allow" # Could be "Deny" with specific allow rules for production
  }
}

# Store PostgreSQL admin password in Key Vault
resource "azurerm_key_vault_secret" "postgres_password" {
  name         = "postgres-admin-password"
  value        = random_password.postgres_admin.result
  key_vault_id = azurerm_key_vault.main.id

  depends_on = [
    azurerm_role_assignment.terraform_keyvault_admin
  ]
}

# Grant the current user/service principal Key Vault Administrator role
# This is needed for Terraform to be able to create secrets
resource "azurerm_role_assignment" "terraform_keyvault_admin" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}
