resource "azurerm_application_insights" "app_insights" {
  name                = format("appi-%s-%s", var.project_name, var.environment_name)
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = var.log_analytics_workspace_id
  application_type    = "web"
  retention_in_days   = 180
}
