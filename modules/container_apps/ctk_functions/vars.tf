variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "environment_name" {
  type        = string
  description = "Name of the environment."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to put the container app in."
}

variable "container_app_environment_id" {
  type        = string
  description = "ID of the Container App Environment."
}

variable "acr_login_server" {
  type        = string
  description = "Login server URL of the Azure Container Registry."
}

variable "image_tag" {
  type        = string
  description = "Tag of the container image to deploy."
  default     = "latest"
}

variable "postgres_host" {
  type        = string
  description = "PostgreSQL database host."
}

variable "postgres_port" {
  type        = string
  description = "PostgreSQL database port."
  default     = "5432"
}

variable "postgres_db" {
  type        = string
  description = "PostgreSQL database name."
}

variable "postgres_user" {
  type        = string
  description = "PostgreSQL database user."
}

variable "postgres_password" {
  type        = string
  description = "PostgreSQL database password."
  sensitive   = true
}

variable "cloai_model" {
  type        = string
  description = "CLOAI model to use."
}

variable "cloai_service_url" {
  type        = string
  description = "URL of the CLOAI service."
}

variable "languagetool_url" {
  type        = string
  description = "URL of the LanguageTool service."
}

variable "redcap_api_token_secret_id" {
  type        = string
  description = "The Key Vault secret ID for the REDCAP_API_TOKEN."
}

variable "azure_blob_connection_string_secret_id" {
  type        = string
  description = "The Key Vault secret ID for the AZURE_BLOB_CONNECTION_STRING."
}

variable "key_vault_id" {
  type        = string
  description = "The ID of the Key Vault to grant access to."
}

variable "acr_id" {
  type        = string
  description = "The ID of the Azure Container Registry."
}


variable "acr_admin_username" {
  type        = string
  description = "Admin username for the Azure Container Registry."
}

variable "acr_admin_password" {
  type        = string
  description = "Admin password for the Azure Container Registry."
  sensitive   = true
}
