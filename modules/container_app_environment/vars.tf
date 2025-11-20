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
  description = "Name of the region to put the container app environment in."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to put the container app environment in."
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "ID of the log analytics workspace."
}

variable "infrastructure_subnet_id" {
  type        = string
  description = "ID of the subnet for the container app environment infrastructure."
  default     = null
}

variable "internal_load_balancer_enabled" {
  type        = bool
  description = "Whether to use an internal load balancer for the container app environment."
  default     = false
}
