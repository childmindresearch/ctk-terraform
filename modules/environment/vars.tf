variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "environment_name" {
  type        = string
  description = "Name of the environment (prod, dev, etc)."
}

variable "region_name" {
  type        = string
  description = "Azure region name."
}

variable "database_name" {
  type        = string
  description = "PostgreSQL database name."
}

variable "acr_sku" {
  type        = string
  description = "SKU for Azure Container Registry."
  default     = "Basic"
}

variable "webapp_image_tag" {
  type        = string
  description = "Tag of the webapp container image to deploy."
  default     = "latest"
}

variable "cloai_service_image_tag" {
  type        = string
  description = "Tag of the cloai-service container image to deploy."
  default     = "latest"
}

variable "ctk_functions_image_tag" {
  type        = string
  description = "Tag of the ctk-functions container image to deploy."
  default     = "latest"
}

variable "cloai_model" {
  type        = string
  description = "CLOAI model to use."
}

variable "azure_ad_client_id" {
  type        = string
  description = "Azure AD application (client) ID for SSO."
}

variable "azure_ad_tenant_id" {
  type        = string
  description = "Azure AD tenant ID."
}

variable "azure_ad_client_secret" {
  type        = string
  description = "Azure AD application client secret."
  sensitive   = true
}
