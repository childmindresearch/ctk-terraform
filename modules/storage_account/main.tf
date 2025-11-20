resource "azurerm_storage_account" "storage" {
  name                     = format("st%s%s", var.project_name, var.environment_name)
  resource_group_name      = var.resource_group_name
  location                 = var.region_name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = var.storage_subnet_id != null ? [var.storage_subnet_id] : []
  }

  tags = {
    environment = var.environment_name
    project     = var.project_name
  }
}
