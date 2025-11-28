resource "azurerm_container_registry" "acr" {
  name                = format("acr%s%s", var.project_name, var.environment_name) // Only alphanumeric.
  resource_group_name = var.resource_group_name
  location            = var.region_name
  sku                 = var.acr_sku
  admin_enabled       = true

  lifecycle {
    prevent_destroy = true
  }
}
