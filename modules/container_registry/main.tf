/**
 * # Container Registry
 *
 * Provisions an Azure Container Registry (ACR) with admin access enabled and a `prevent_destroy` lifecycle guard.
 */

resource "azurerm_container_registry" "acr" {
  name                = format("acr%s%s", var.project_name, var.environment_name) // Only alphanumeric.
  resource_group_name = var.resource_group_name
  location            = var.region_name
  sku                 = var.acr_sku
  admin_enabled       = true

  tags = {
    environment = var.environment_name
    project     = var.project_name
  }

  lifecycle {
    prevent_destroy = true
  }
}
