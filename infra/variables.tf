variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "rg-quiz-app"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "westus"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry (must be globally unique, alphanumeric only)"
  type        = string
  default     = "acrquizapp"
}

variable "postgres_server_name" {
  description = "Name of the PostgreSQL server (must be globally unique)"
  type        = string
  default     = "psql-quiz-app"
}

variable "postgres_database_name" {
  description = "Name of the PostgreSQL database"
  type        = string
  default     = "quizdb"
}

variable "postgres_admin_username" {
  description = "PostgreSQL administrator username"
  type        = string
  default     = "quizadmin"
}

variable "key_vault_name" {
  description = "Name of the Azure Key Vault (must be globally unique, 3-24 characters, alphanumeric and hyphens only)"
  type        = string
  default     = "kv-quiz-app"
}

variable "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace"
  type        = string
  default     = "log-quiz-app"
}

variable "container_app_environment_name" {
  description = "Name of the Container Apps environment"
  type        = string
  default     = "env-quiz-app"
}

variable "container_app_name" {
  description = "Name of the Container App"
  type        = string
  default     = "app-quiz"
}

variable "app_image_name" {
  description = "Name of the container image"
  type        = string
  default     = "quiz-app"
}

variable "app_image_tag" {
  description = "Tag of the container image"
  type        = string
  default     = "latest"
}
