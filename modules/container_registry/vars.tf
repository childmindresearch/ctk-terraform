variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to create the container registry in."
}

variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "environment_name" {
  type        = string
  description = "Name of the environment (e.g., dev, prod)."
}

variable "region_name" {
  type        = string
  description = "Name of the region to create the container registry in."
}

variable "acr_sku" {
  type        = string
  description = "SKU of the Azure Container Registry."
    default     = "Basic"
    validation {
        condition     = contains(["Basic", "Standard", "Premium"], var.acr_sku)
        error_message = "The acr_sku must be one of 'Basic', 'Standard', or 'Premium'."
    }
}