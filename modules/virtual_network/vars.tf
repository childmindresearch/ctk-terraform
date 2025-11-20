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
  description = "Name of the region to put the virtual network in."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the virtual network."
  default     = ["10.0.0.0/16"]
}

variable "container_apps_subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the container apps subnet."
  default     = ["10.0.0.0/23"]
}

variable "database_subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the database subnet."
  default     = ["10.0.2.0/24"]
}

variable "storage_subnet_address_prefixes" {
  type        = list(string)
  description = "Address prefixes for the storage subnet."
  default     = ["10.0.3.0/24"]
}
