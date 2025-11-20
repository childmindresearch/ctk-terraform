output "id" {
  value       = azurerm_log_analytics_workspace.log_analytics.id
  description = "The ID of the Log Analytics Workspace."
}

output "workspace_id" {
  value       = azurerm_log_analytics_workspace.log_analytics.workspace_id
  description = "The Workspace (or Customer) ID of the Log Analytics Workspace."
}

output "primary_shared_key" {
  value       = azurerm_log_analytics_workspace.log_analytics.primary_shared_key
  description = "The Primary shared key for the Log Analytics Workspace."
  sensitive   = true
}
