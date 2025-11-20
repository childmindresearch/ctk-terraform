variable "project_name" {
  type        = string
  description = "Name of the project."
  default = "ctk"
}

variable "region_name" {
  type        = string
  description = "Name of the region to put the resource group in."
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
  default = "sonnet-4.0-v1"
}
