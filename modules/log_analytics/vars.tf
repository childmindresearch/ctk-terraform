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
  description = "Name of the region to put the log analytics workspace in."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "sku" {
  type        = string
  description = "Specifies the SKU of the Log Analytics Workspace."
  default     = "PerGB2018"
}

variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days."
  default     = 30
}
