variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "environment_name" {
  type        = string
  description = "Name of the environment."
}

variable "region_name" {
  type        = string
  description = "Name of the region to put the key vault in."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "sku_name" {
  type        = string
  description = "The SKU name of the Key Vault. Possible values are standard and premium."
  default     = "standard"
}

variable "soft_delete_retention_days" {
  type        = number
  description = "The number of days that items should be retained for once soft-deleted."
  default     = 90
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Is Purge Protection enabled for this Key Vault?"
  default     = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs that can access the Key Vault."
  default     = []
}
