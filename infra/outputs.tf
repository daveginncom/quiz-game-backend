output "resource_group_name" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "acr_login_server" {
  description = "Login server URL for the Azure Container Registry"
  value       = azurerm_container_registry.main.login_server
}

output "acr_admin_username" {
  description = "Admin username for the Azure Container Registry"
  value       = azurerm_container_registry.main.admin_username
  sensitive   = true
}

output "acr_admin_password" {
  description = "Admin password for the Azure Container Registry"
  value       = azurerm_container_registry.main.admin_password
  sensitive   = true
}

output "postgres_fqdn" {
  description = "Fully qualified domain name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.main.fqdn
}

output "postgres_database_name" {
  description = "Name of the PostgreSQL database"
  value       = azurerm_postgresql_flexible_server_database.main.name
}

output "container_app_url" {
  description = "URL of the Container App"
  value       = length(azurerm_container_app.main.ingress) > 0 ? "https://${azurerm_container_app.main.ingress[0].fqdn}" : "Container App not yet deployed"
}

output "container_app_fqdn" {
  description = "Fully qualified domain name of the Container App"
  value       = length(azurerm_container_app.main.ingress) > 0 ? azurerm_container_app.main.ingress[0].fqdn : "Not yet deployed"
}
