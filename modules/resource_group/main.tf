resource "azurerm_resource_group" "resource_group" {
  name     = format("rg-%s-%s", var.project_name, var.environment_name)
  location = var.region_name
}

