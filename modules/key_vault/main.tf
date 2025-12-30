data "azurerm_client_config" "current" {}

data "http" "current_ip" {
  url = "https://api.ipify.org?format=text"
}

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
    ip_rules                   = [data.http.current_ip.response_body]
  }

  tags = {
    environment = var.environment_name
    project     = var.project_name
  }
}

resource "azurerm_role_assignment" "terraform_kv_secrets_officer" {
  scope                = azurerm_key_vault.kv.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}



