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
  description = "Name of the region to put the Cosmos DB cluster in."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "vnet_id" {
  type        = string
  description = "ID of the virtual network."
}

variable "administrator_password" {
  type        = string
  description = "Administrator password for the Cosmos DB PostgreSQL cluster."
  sensitive   = true
}

variable "coordinator_storage_quota_in_mb" {
  type        = number
  description = "Storage quota in MB for the coordinator node."
  default     = 32768
}

variable "coordinator_vcore_count" {
  type        = number
  description = "Number of vCores for the coordinator node."
  default     = 1
}

variable "coordinator_server_edition" {
  type        = string
  description = "The server edition for the coordinator node."
  default     = "BurstableMemoryOptimized"
}

variable "node_count" {
  type        = number
  description = "Number of worker nodes in the cluster."
  default     = 0
}

variable "node_storage_quota_in_mb" {
  type        = number
  description = "Storage quota in MB for each worker node."
  default     = 524288
}

variable "node_vcores" {
  type        = number
  description = "Number of vCores for each worker node."
  default     = 2
}

variable "node_server_edition" {
  type        = string
  description = "The server edition for the worker nodes."
  default     = "GeneralPurpose"
}

variable "private_endpoint_subnet_id" {
  type        = string
  description = "The private endpoint's subnet ID."
}
