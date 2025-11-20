resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = format("log-%s-%s", var.project_name, var.environment_name)
  location            = var.region_name
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days

  tags = {
    environment = var.environment_name
    project     = var.project_name
  }
}
