output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "The ID of the Virtual Network."
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "The name of the Virtual Network."
}

output "container_apps_subnet_id" {
  value       = azurerm_subnet.container_apps.id
  description = "The ID of the container apps subnet."
}

output "database_subnet_id" {
  value       = azurerm_subnet.database.id
  description = "The ID of the database subnet."
}

output "storage_subnet_id" {
  value       = azurerm_subnet.storage.id
  description = "The ID of the storage subnet."
}
