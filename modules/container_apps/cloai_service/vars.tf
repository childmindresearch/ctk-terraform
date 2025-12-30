
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

variable "region_name" {
  type        = string
  description = "Region for the User-Assigned Identity."
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

variable "config_json_secret_id" {
  type        = string
  description = "The Key Vault secret ID for the CONFIG_JSON."
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
