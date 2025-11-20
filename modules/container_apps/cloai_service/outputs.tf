output "fqdn" {
  value       = azurerm_container_app.cloai_service.latest_revision_fqdn
  description = "The FQDN of the cloai-service container app."
}

output "id" {
  value       = azurerm_container_app.cloai_service.id
  description = "The ID of the cloai-service container app."
}

output "name" {
  value       = azurerm_container_app.cloai_service.name
  description = "The name of the cloai-service container app."
}

output "principal_id" {
  value       = azurerm_container_app.cloai_service.identity[0].principal_id
  description = "The Principal ID of the container app's managed identity."
}
