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

variable "container_app_environment_id" {
  type        = string
  description = "ID of the Container App Environment."
}
