<!-- BEGIN_TF_DOCS -->
# Container App — Webapp

Deploys the CTK Webapp container app with external ingress, a custom domain, managed SSL, and Azure AD authentication via a user-assigned identity with `AcrPull` access.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 2.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | ~> 2.7 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.managed_cert](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_resource_action.my_app_auth](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource_action) | resource |
| [azapi_update_resource.webapp_bind_domain](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/update_resource) | resource |
| [azurerm_container_app.webapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app) | resource |
| [azurerm_role_assignment.webapp_acr_pull](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.webapp_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_admin_password"></a> [acr\_admin\_password](#input\_acr\_admin\_password) | Admin password for the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_acr_admin_username"></a> [acr\_admin\_username](#input\_acr\_admin\_username) | Admin username for the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_acr_id"></a> [acr\_id](#input\_acr\_id) | The ID of the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_acr_login_server"></a> [acr\_login\_server](#input\_acr\_login\_server) | Login server URL of the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_application_insights_connection_string"></a> [application\_insights\_connection\_string](#input\_application\_insights\_connection\_string) | Connection string for Application Insights. | `string` | n/a | yes |
| <a name="input_azure_ad_client_id"></a> [azure\_ad\_client\_id](#input\_azure\_ad\_client\_id) | Azure AD application (client) ID for SSO. | `string` | n/a | yes |
| <a name="input_azure_ad_client_secret"></a> [azure\_ad\_client\_secret](#input\_azure\_ad\_client\_secret) | Azure AD application (client) secret for SSO. | `string` | n/a | yes |
| <a name="input_azure_ad_tenant_id"></a> [azure\_ad\_tenant\_id](#input\_azure\_ad\_tenant\_id) | Azure AD tenant ID. | `string` | n/a | yes |
| <a name="input_azure_blob_account_name"></a> [azure\_blob\_account\_name](#input\_azure\_blob\_account\_name) | Azure Blob Storage account name. | `string` | n/a | yes |
| <a name="input_container_app_environment_id"></a> [container\_app\_environment\_id](#input\_container\_app\_environment\_id) | ID of the Container App Environment. | `string` | n/a | yes |
| <a name="input_ctk_functions_url"></a> [ctk\_functions\_url](#input\_ctk\_functions\_url) | URL of the CTK Functions service. | `string` | n/a | yes |
| <a name="input_custom_domain"></a> [custom\_domain](#input\_custom\_domain) | The custom domain to associate with the container app. | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name of the environment. | `string` | n/a | yes |
| <a name="input_languagetool_url"></a> [languagetool\_url](#input\_languagetool\_url) | URL of the LanguageTool service. | `string` | n/a | yes |
| <a name="input_postgres_db"></a> [postgres\_db](#input\_postgres\_db) | PostgreSQL database name. | `string` | n/a | yes |
| <a name="input_postgres_host"></a> [postgres\_host](#input\_postgres\_host) | PostgreSQL database host. | `string` | n/a | yes |
| <a name="input_postgres_password"></a> [postgres\_password](#input\_postgres\_password) | PostgreSQL database password. | `string` | n/a | yes |
| <a name="input_postgres_user"></a> [postgres\_user](#input\_postgres\_user) | PostgreSQL database user. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_redcap_cmi_api_token"></a> [redcap\_cmi\_api\_token](#input\_redcap\_cmi\_api\_token) | API Token for CMI-RedCap. | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Azure region to deploy the app. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to put the container app in. | `string` | n/a | yes |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Tag of the container image to deploy. | `string` | `"latest"` | no |
| <a name="input_postgres_port"></a> [postgres\_port](#input\_postgres\_port) | PostgreSQL database port. | `string` | `"5432"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the webapp container app. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the webapp container app. |
| <a name="output_name"></a> [name](#output\_name) | The name of the webapp container app. |
| <a name="output_url"></a> [url](#output\_url) | The URL of the webapp container app. |
<!-- END_TF_DOCS -->
