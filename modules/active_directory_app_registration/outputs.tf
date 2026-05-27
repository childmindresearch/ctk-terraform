output "client_id" {
  description = "The client ID of the Azure AD application."
  value       = azuread_application.app.client_id
}

output "client_secret" {
  description = "The client secret of the Azure AD application."
  value       = azuread_application_password.secret.value
  sensitive   = true
}

output "tenant_id" {
  description = "The Azure AD tenant ID."
  value       = data.azuread_client_config.current.tenant_id
}
