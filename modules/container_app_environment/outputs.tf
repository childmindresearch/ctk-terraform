output "container_app_environment_id" {
  value       = azurerm_container_app_environment.container_environment.id
  description = "The ID of the Container App Environment."
}

output "container_app_environment_name" {
  value       = azurerm_container_app_environment.container_environment.name
  description = "The name of the Container App Environment."
}

output "default_domain" {
  value       = azurerm_container_app_environment.container_environment.default_domain
  description = "The default domain of the Container App Environment."
}
