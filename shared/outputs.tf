output "acr_id" {
  description = "The ID of the shared Azure Container Registry."
  value       = module.shared_container_registry.container_registry_id
}

output "acr_login_server" {
  description = "The login server URL of the shared Azure Container Registry."
  value       = module.shared_container_registry.container_registry_login_server
}

output "resource_group_name" {
  description = "The name of the shared resource group."
  value       = module.shared_resource_group.name
}
