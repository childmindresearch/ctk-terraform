resource "azurerm_virtual_network" "vnet" {
  name                = format("vnet-%s-%s", var.project_name, var.environment_name)
  location            = var.region_name
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = {
    environment = var.environment_name
    project     = var.project_name
  }
}

resource "azurerm_subnet" "container_apps" {
  name                 = "snet-container-apps"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.container_apps_subnet_address_prefixes
  service_endpoints    = ["Microsoft.KeyVault"]
}

resource "azurerm_subnet" "database" {
  name                 = "snet-database"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.database_subnet_address_prefixes
}

resource "azurerm_subnet" "storage" {
  name                 = "snet-storage"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.storage_subnet_address_prefixes

  service_endpoints = ["Microsoft.Storage", "Microsoft.KeyVault"]
}
