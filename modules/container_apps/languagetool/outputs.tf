output "fqdn" {
  value       = azurerm_container_app.languagetool.latest_revision_fqdn
  description = "The FQDN of the LanguageTool container app."
}

output "id" {
  value       = azurerm_container_app.languagetool.id
  description = "The ID of the LanguageTool container app."
}

output "name" {
  value       = azurerm_container_app.languagetool.name
  description = "The name of the LanguageTool container app."
}
