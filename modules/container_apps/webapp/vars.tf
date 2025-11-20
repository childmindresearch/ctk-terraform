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

variable "languagetool_url" {
  type        = string
  description = "URL of the LanguageTool service."
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

variable "azure_blob_account_name" {
  type        = string
  description = "Azure Blob Storage account name."
}

variable "azure_ad_client_id" {
  type        = string
  description = "Azure AD application (client) ID for SSO."
}

variable "azure_ad_tenant_id" {
  type        = string
  description = "Azure AD tenant ID."
}

