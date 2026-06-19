output "connection_string" {
  description = "The connection string for Application Insights."
  value       = azurerm_application_insights.app_insights.connection_string
  sensitive   = true
}

output "instrumentation_key" {
  description = "The instrumentation key for Application Insights."
  value       = azurerm_application_insights.app_insights.instrumentation_key
  sensitive   = true
}
