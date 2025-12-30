output "fqdn" {
  value       = azurerm_container_app.ctk_functions.ingress[0].fqdn
  description = "The FQDN of the ctk-functions container app."
}

output "id" {
  value       = azurerm_container_app.ctk_functions.id
  description = "The ID of the ctk-functions container app."
}

output "name" {
  value       = azurerm_container_app.ctk_functions.name
  description = "The name of the ctk-functions container app."
}

output "principal_id" {
  value       = azurerm_container_app.ctk_functions.identity[0].principal_id
  description = "The Principal ID of the container app's managed identity."
}
