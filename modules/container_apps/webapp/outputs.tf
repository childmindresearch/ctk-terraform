output "fqdn" {
  value       = azurerm_container_app.webapp.latest_revision_fqdn
  description = "The FQDN of the webapp container app."
}

output "url" {
  value       = "https://${azurerm_container_app.webapp.latest_revision_fqdn}"
  description = "The URL of the webapp container app."
}

output "id" {
  value       = azurerm_container_app.webapp.id
  description = "The ID of the webapp container app."
}

output "name" {
  value       = azurerm_container_app.webapp.name
  description = "The name of the webapp container app."
}
