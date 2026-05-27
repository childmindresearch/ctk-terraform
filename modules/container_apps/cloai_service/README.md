<!-- BEGIN_TF_DOCS -->
# Container App — CLOAI Service

Deploys the CLOAI inference service as an internal container app with a `CONFIG_JSON` secret sourced from Key Vault and `WEB_CONCURRENCY=4`.

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
| [azurerm_container_app.cloai_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_app) | resource |
| [azurerm_role_assignment.cloai_acr_pull](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.cloai_kv_secrets_user](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.cloai_identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_admin_username"></a> [acr\_admin\_username](#input\_acr\_admin\_username) | Admin username for the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_acr_id"></a> [acr\_id](#input\_acr\_id) | The ID of the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_acr_login_server"></a> [acr\_login\_server](#input\_acr\_login\_server) | Login server URL of the Azure Container Registry. | `string` | n/a | yes |
| <a name="input_config_json_secret_id"></a> [config\_json\_secret\_id](#input\_config\_json\_secret\_id) | The Key Vault secret ID for the CONFIG\_JSON. | `string` | n/a | yes |
| <a name="input_container_app_environment_id"></a> [container\_app\_environment\_id](#input\_container\_app\_environment\_id) | ID of the Container App Environment. | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name of the environment. | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The ID of the Key Vault to grant access to. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Region for the User-Assigned Identity. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to put the container app in. | `string` | n/a | yes |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Tag of the container image to deploy. | `string` | `"latest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | The FQDN of the cloai-service container app. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the cloai-service container app. |
| <a name="output_name"></a> [name](#output\_name) | The name of the cloai-service container app. |
| <a name="output_principal_id"></a> [principal\_id](#output\_principal\_id) | The Principal ID of the container app's managed identity. |
<!-- END_TF_DOCS -->
