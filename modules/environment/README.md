<!-- BEGIN_TF_DOCS -->
# Environment

Orchestrator module that composes all infrastructure sub-modules into a complete environment, wiring networking, storage, secrets, database, monitoring, AD authentication, and all container apps.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_active_directory_app_registration"></a> [active\_directory\_app\_registration](#module\_active\_directory\_app\_registration) | ../active_directory_app_registration | n/a |
| <a name="module_application_insights"></a> [application\_insights](#module\_application\_insights) | ../application_insights | n/a |
| <a name="module_cloai_service"></a> [cloai\_service](#module\_cloai\_service) | ../container_apps/cloai_service | n/a |
| <a name="module_container_app_environment"></a> [container\_app\_environment](#module\_container\_app\_environment) | ../container_app_environment | n/a |
| <a name="module_cosmos_postgres"></a> [cosmos\_postgres](#module\_cosmos\_postgres) | ../cosmos_postgres | n/a |
| <a name="module_ctk_functions"></a> [ctk\_functions](#module\_ctk\_functions) | ../container_apps/ctk_functions | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../key_vault | n/a |
| <a name="module_languagetool"></a> [languagetool](#module\_languagetool) | ../container_apps/languagetool | n/a |
| <a name="module_log_analytics"></a> [log\_analytics](#module\_log\_analytics) | ../log_analytics | n/a |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | ../resource_group | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../storage_account | n/a |
| <a name="module_virtual_network"></a> [virtual\_network](#module\_virtual\_network) | ../virtual_network | n/a |
| <a name="module_webapp"></a> [webapp](#module\_webapp) | ../container_apps/webapp | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.postgres_admin_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [random_password.postgres_admin_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azuread_group.ctk_owners](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_admin_password"></a> [acr\_admin\_password](#input\_acr\_admin\_password) | Admin password for the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_acr_admin_username"></a> [acr\_admin\_username](#input\_acr\_admin\_username) | Admin username for the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_acr_id"></a> [acr\_id](#input\_acr\_id) | The ID of the shared Azure Container Registry. | `string` | n/a | yes |
| <a name="input_acr_login_server"></a> [acr\_login\_server](#input\_acr\_login\_server) | The login server URL of the shared Azure Container Registry. | `string` | n/a | yes |
| <a name="input_ad_redirect_uris"></a> [ad\_redirect\_uris](#input\_ad\_redirect\_uris) | URIs to redirect to for authentication. The container's FQDN is added by default. | `list(string)` | n/a | yes |
| <a name="input_cloai_model"></a> [cloai\_model](#input\_cloai\_model) | CLOAI model to use. | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name of the environment (prod, dev, etc). | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Azure region name. | `string` | n/a | yes |
| <a name="input_webapp_custom_domain"></a> [webapp\_custom\_domain](#input\_webapp\_custom\_domain) | The custom domain to associate with the webapp container. | `string` | n/a | yes |
| <a name="input_cloai_service_image_tag"></a> [cloai\_service\_image\_tag](#input\_cloai\_service\_image\_tag) | Tag of the cloai-service container image to deploy. | `string` | `"latest"` | no |
| <a name="input_ctk_functions_image_tag"></a> [ctk\_functions\_image\_tag](#input\_ctk\_functions\_image\_tag) | Tag of the ctk-functions container image to deploy. | `string` | `"latest"` | no |
| <a name="input_webapp_image_tag"></a> [webapp\_image\_tag](#input\_webapp\_image\_tag) | Tag of the webapp container image to deploy. | `string` | `"latest"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->