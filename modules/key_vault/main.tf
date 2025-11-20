data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                       = format("kv-%s-%s", var.project_name, var.environment_name)
  location                   = var.region_name
  resource_group_name        = var.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = var.sku_name
  soft_delete_retention_days = var.soft_delete_retention_days
  purge_protection_enabled   = var.purge_protection_enabled

  enable_rbac_authorization = true

  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = var.subnet_ids
  }

  tags = {
    environment = var.environment_name
    project     = var.project_name
  }
}
