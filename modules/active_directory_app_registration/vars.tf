variable "display_name" {
  description = "The display name for the application."
  type        = string
}

variable "redirect_uris" {
  description = "A set of redirect URIs for the application."
  type        = list(string)
  default     = []
}

variable "owner_group_object_id" {
  description = "Object ID of the owner group of these resources."
  type        = string
}
