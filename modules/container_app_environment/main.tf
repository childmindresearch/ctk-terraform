resource "azurerm_container_app_environment" "container_environment" {
  name                           = format("cae-%s-%s", var.project_name, var.environment_name)
  location                       = var.region_name
  resource_group_name            = var.resource_group_name
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  infrastructure_subnet_id       = var.infrastructure_subnet_id
  internal_load_balancer_enabled = var.internal_load_balancer_enabled

  tags = {
    environment = var.environment_name
    project     = var.project_name
  }
}
