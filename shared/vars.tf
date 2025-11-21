variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "region_name" {
  type        = string
  description = "Azure region for shared resources."
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
}

variable "acr_sku" {
  type        = string
  description = "SKU for the Azure Container Registry."
  default     = "Basic"
}
