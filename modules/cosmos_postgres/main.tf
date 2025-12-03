resource "azurerm_cosmosdb_postgresql_cluster" "cluster" {
  name                            = format("cosmos-pg-%s-%s", var.project_name, var.environment_name)
  resource_group_name             = var.resource_group_name
  location                        = var.region_name
  administrator_login_password    = var.administrator_password
  coordinator_storage_quota_in_mb = var.coordinator_storage_quota_in_mb
  coordinator_vcore_count         = var.coordinator_vcore_count
  coordinator_server_edition      = var.coordinator_server_edition
  node_count                      = var.node_count
  node_storage_quota_in_mb        = var.node_storage_quota_in_mb
  node_vcores                     = var.node_vcores
  node_server_edition            = var.node_server_edition

  tags = {
    environment = var.environment_name
    project     = var.project_name
  }
}

resource "azurerm_private_dns_zone" "cosmos_postgres" {
  name                = "privatelink.postgres.cosmos.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "cosmos_postgres" {
  name                  = format("pdns-link-%s-%s", var.project_name, var.environment_name)
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.cosmos_postgres.name
  virtual_network_id    = var.vnet_id
}
