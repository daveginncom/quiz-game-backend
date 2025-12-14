# Container App
# This is separated so it can be applied after the image is pushed to ACR
resource "azurerm_container_app" "main" {
  name                         = var.container_app_name
  container_app_environment_id = azurerm_container_app_environment.main.id
  resource_group_name          = azurerm_resource_group.main.name
  revision_mode                = "Single"

  # Enable System-Assigned Managed Identity
  identity {
    type = "SystemAssigned"
  }

  registry {
    server               = azurerm_container_registry.main.login_server
    username             = azurerm_container_registry.main.admin_username
    password_secret_name = "registry-password"
  }

  secret {
    name  = "registry-password"
    value = azurerm_container_registry.main.admin_password
  }

  template {
    container {
      name   = "quiz-app"
      image  = "${azurerm_container_registry.main.login_server}/${var.app_image_name}:${var.app_image_tag}"
      cpu    = 0.5
      memory = "1Gi"

      # Azure Key Vault configuration - Enable Spring Cloud Azure Key Vault integration
      env {
        name  = "SPRING_CLOUD_AZURE_KEYVAULT_SECRET_PROPERTY_SOURCE_ENABLED"
        value = "true"
      }

      env {
        name  = "SPRING_CLOUD_AZURE_KEYVAULT_SECRET_PROPERTY_SOURCES_0_ENDPOINT"
        value = azurerm_key_vault.main.vault_uri
      }

      env {
        name  = "SPRING_CLOUD_AZURE_KEYVAULT_SECRET_PROPERTY_SOURCES_0_CREDENTIAL_MANAGED_IDENTITY_ENABLED"
        value = "true"
      }

      # Database configuration
      env {
        name  = "SPRING_DATASOURCE_URL"
        value = "jdbc:postgresql://${azurerm_postgresql_flexible_server.main.fqdn}:5432/${var.postgres_database_name}?sslmode=require"
      }

      env {
        name  = "SPRING_DATASOURCE_USERNAME"
        value = var.postgres_admin_username
      }

      # Spring Cloud Azure automatically loads Key Vault secret "postgres-admin-password"
      # as Spring property "postgres.admin.password". We configure Spring Boot to use this
      # property for the datasource password via application.properties:
      #   spring.datasource.password=${postgres.admin.password}
      # No explicit env var mapping needed here - it's handled in application config.

      env {
        name  = "SPRING_JPA_HIBERNATE_DDL_AUTO"
        value = "none"
      }

      env {
        name  = "SPRING_FLYWAY_ENABLED"
        value = "true"
      }
    }

    min_replicas = 1
    max_replicas = 3
  }

  ingress {
    external_enabled = true
    target_port      = 8080
    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  # Container App needs Key Vault to exist (for env vars), but not the role assignment
  depends_on = [
    azurerm_key_vault.main,
    azurerm_key_vault_secret.postgres_password
  ]
}

# Grant Container App's managed identity access to Key Vault secrets
# This happens AFTER Container App is created (so identity exists)
resource "azurerm_role_assignment" "container_app_keyvault_secrets_user" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_container_app.main.identity[0].principal_id

  # Explicit dependency to ensure Container App is created first
  depends_on = [
    azurerm_container_app.main
  ]
}
