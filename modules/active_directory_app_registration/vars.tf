variable "display_name" {
  description = "The display name for the application."
  type        = string
}

variable "redirect_uris" {
  description = "A set of redirect URIs for the application."
  type        = list(string)
  default     = []
}
