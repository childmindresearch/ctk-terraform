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

variable "acr_id" {
  type        = string
  description = "The ID of the shared Azure Container Registry."
}

variable "acr_login_server" {
  type        = string
  description = "The login server URL of the shared Azure Container Registry."
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

variable "acr_admin_username" {
  type        = string
  description = "Admin username for the Azure Container Registry."
}

variable "acr_admin_password" {
  type        = string
  description = "Admin password for the Azure Container Registry."
  sensitive   = true
}

variable "ad_redirect_uris" {
  type        = list(string)
  description = "URIs to redirect to for authentication. The container's FQDN is added by default."
}

