<!-- BEGIN_TF_DOCS -->
# Container App — CTK Functions

Deploys the CTK Functions service as an internal container app with Key Vault secret references via a user-assigned identity with `AcrPull` and `Key Vault Secrets User` roles.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_app.ctk_functions](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app) | resource |
| [azurerm_role_assignment.ctk_functions_acr_pull](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.ctk_functions_kv_secrets_user](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.ctk_functions_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_admin_username"></a> [acr\_admin\_username](#input\_acr\_admin\_username) | Admin username for the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_acr_id"></a> [acr\_id](#input\_acr\_id) | The ID of the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_acr_login_server"></a> [acr\_login\_server](#input\_acr\_login\_server) | Login server URL of the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_cloai_model"></a> [cloai\_model](#input\_cloai\_model) | CLOAI model to use. | `string` | n/a | yes |
| <a name="input_cloai_service_url"></a> [cloai\_service\_url](#input\_cloai\_service\_url) | URL of the CLOAI service. | `string` | n/a | yes |
| <a name="input_container_app_environment_id"></a> [container\_app\_environment\_id](#input\_container\_app\_environment\_id) | ID of the Container App Environment. | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name of the environment. | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the Key Vault to grant access to. | `string` | n/a | yes |
| <a name="input_languagetool_url"></a> [languagetool\_url](#input\_languagetool\_url) | URL of the LanguageTool service. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_redcap_cmi_api_token_secret_id"></a> [redcap\_cmi\_api\_token\_secret\_id](#input\_redcap\_cmi\_api\_token\_secret\_id) | The Key Vault secret ID for the cmi Redcap token. | `string` | n/a | yes |
| <a name="input_redcap_hbn_api_token_secret_id"></a> [redcap\_hbn\_api\_token\_secret\_id](#input\_redcap\_hbn\_api\_token\_secret\_id) | The Key Vault secret ID for the HBN Redcap token. | `string` | n/a | yes |
| <a name="input_redcap_pyrite_api_token_secret_id"></a> [redcap\_pyrite\_api\_token\_secret\_id](#input\_redcap\_pyrite\_api\_token\_secret\_id) | The Key Vault secret ID for the pyrite Redcap token. | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Region for the User-Assigned Identity. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to put the container app in. | `string` | n/a | yes |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Tag of the container image to deploy. | `string` | `"latest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the ctk-functions container app. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the ctk-functions container app. |
| <a name="output_name"></a> [name](#output\_name) | The name of the ctk-functions container app. |
| <a name="output_principal_id"></a> [principal\_id](#output\_principal\_id) | The Principal ID of the container app's managed identity. |
<!-- END_TF_DOCS -->
