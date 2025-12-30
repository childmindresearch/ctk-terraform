module "resource_group" {
  source           = "../resource_group"
  project_name     = var.project_name
  region_name      = var.region_name
  environment_name = var.environment_name
}

module "log_analytics" {
  source              = "../log_analytics"
  resource_group_name = module.resource_group.name
  project_name        = var.project_name
  environment_name    = var.environment_name
  region_name         = var.region_name
}

module "application_insights" {
  source                     = "../application_insights"
  resource_group_name        = module.resource_group.name
  project_name               = var.project_name
  environment_name           = var.environment_name
  location                   = var.region_name
  log_analytics_workspace_id = module.log_analytics.id
}

module "virtual_network" {
  source              = "../virtual_network"
  resource_group_name = module.resource_group.name
  project_name        = var.project_name
  environment_name    = var.environment_name
  region_name         = var.region_name
}

module "storage_account" {
  source              = "../storage_account"
  resource_group_name = module.resource_group.name
  project_name        = var.project_name
  environment_name    = var.environment_name
  region_name         = var.region_name
  storage_subnet_id   = module.virtual_network.storage_subnet_id
}

module "key_vault" {
  source              = "../key_vault"
  resource_group_name = module.resource_group.name
  project_name        = var.project_name
  environment_name    = var.environment_name
  region_name         = var.region_name
  subnet_ids          = [module.virtual_network.storage_subnet_id, module.virtual_network.container_apps_subnet_id]
}

resource "random_password" "postgres_admin_password" {
  length  = 64
  special = false // '@' causes issues for Drizzle; have not tested other characters but 64 alphanumeric characters should be sufficient entropy.
}

resource "azurerm_key_vault_secret" "postgres_admin_password" {
  name         = "postgres-admin-password"
  value        = random_password.postgres_admin_password.result
  key_vault_id = module.key_vault.id

  depends_on = [
    module.key_vault
  ]
}

module "cosmos_postgres" {
  source                     = "../cosmos_postgres"
  resource_group_name        = module.resource_group.name
  project_name               = var.project_name
  environment_name           = var.environment_name
  region_name                = var.region_name
  vnet_id                    = module.virtual_network.vnet_id
  private_endpoint_subnet_id = module.virtual_network.database_subnet_id
  administrator_password     = azurerm_key_vault_secret.postgres_admin_password.value
}

module "container_app_environment" {
  source                     = "../container_app_environment"
  resource_group_name        = module.resource_group.name
  project_name               = var.project_name
  environment_name           = var.environment_name
  region_name                = var.region_name
  log_analytics_workspace_id = module.log_analytics.id
  infrastructure_subnet_id   = module.virtual_network.container_apps_subnet_id
}

module "languagetool" {
  source                       = "../container_apps/languagetool"
  resource_group_name          = module.resource_group.name
  project_name                 = var.project_name
  environment_name             = var.environment_name
  container_app_environment_id = module.container_app_environment.container_app_environment_id
}

module "active_directory_app_registration" {
  source       = "../active_directory_app_registration"
  display_name = "ad-${var.project_name}-webapp-${var.environment_name}"
  redirect_uris = [
    "https://ca-${var.project_name}-${var.environment_name}-webapp.${module.container_app_environment.default_domain}/.auth/login/aad/callback",
    "https://cliniciantoolkit.childmind.org/.auth/login/aad/callback"
  ]
}


module "cloai_service" {
  source                       = "../container_apps/cloai_service"
  resource_group_name          = module.resource_group.name
  project_name                 = var.project_name
  region_name                  = var.region_name
  environment_name             = var.environment_name
  container_app_environment_id = module.container_app_environment.container_app_environment_id
  acr_login_server             = var.acr_login_server
  acr_admin_username           = var.acr_admin_username
  acr_admin_password           = var.acr_admin_password
  acr_id                       = var.acr_id
  image_tag                    = var.cloai_service_image_tag
  config_json_secret_id        = "${module.key_vault.vault_uri}secrets/cloai-service-config-json"
  key_vault_id                 = module.key_vault.id
}

module "ctk_functions" {
  source                                 = "../container_apps/ctk_functions"
  resource_group_name                    = module.resource_group.name
  project_name                           = var.project_name
  environment_name                       = var.environment_name
  container_app_environment_id           = module.container_app_environment.container_app_environment_id
  acr_login_server                       = var.acr_login_server
  acr_id                                 = var.acr_id
  acr_admin_username                     = var.acr_admin_username
  acr_admin_password                     = var.acr_admin_password
  image_tag                              = var.ctk_functions_image_tag
  postgres_host                          = module.cosmos_postgres.host
  postgres_port                          = module.cosmos_postgres.port
  postgres_db                            = "citus"
  postgres_user                          = module.cosmos_postgres.administrator_login
  postgres_password                      = module.cosmos_postgres.administrator_password
  cloai_model                            = var.cloai_model
  cloai_service_url                      = "https://${module.cloai_service.fqdn}"
  languagetool_url                       = "https://${module.languagetool.fqdn}"
  redcap_api_token_secret_id             = "${module.key_vault.vault_uri}secrets/redcap-api-token"
  azure_blob_connection_string_secret_id = "${module.key_vault.vault_uri}secrets/azure-blob-connection-string"
  key_vault_id                           = module.key_vault.id
}

module "webapp" {
  source                                 = "../container_apps/webapp"
  resource_group_name                    = module.resource_group.name
  project_name                           = var.project_name
  region_name                            = var.region_name
  environment_name                       = var.environment_name
  container_app_environment_id           = module.container_app_environment.container_app_environment_id
  acr_login_server                       = var.acr_login_server
  acr_admin_username                     = var.acr_admin_username
  acr_admin_password                     = var.acr_admin_password
  acr_id                                 = var.acr_id
  ctk_functions_url                      = "https://${module.ctk_functions.fqdn}"
  languagetool_url                       = "https://${module.languagetool.fqdn}"
  image_tag                              = var.webapp_image_tag
  postgres_host                          = module.cosmos_postgres.host
  postgres_port                          = module.cosmos_postgres.port
  postgres_db                            = "citus"
  postgres_user                          = module.cosmos_postgres.administrator_login
  postgres_password                      = module.cosmos_postgres.administrator_password
  azure_blob_account_name                = module.storage_account.storage_account_name
  azure_ad_client_id                     = module.active_directory_app_registration.client_id
  azure_ad_client_secret                 = module.active_directory_app_registration.client_secret
  azure_ad_tenant_id                     = module.active_directory_app_registration.tenant_id
  application_insights_connection_string = module.application_insights.connection_string
}
