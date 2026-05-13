<!-- BEGIN_TF_DOCS -->
# Shared Infrastructure

Provisions the shared resource group, Azure Container Registry, and storage account deployed once and referenced by all environments via `terraform_remote_state`.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_shared_container_registry"></a> [shared\_container\_registry](#module\_shared\_container\_registry) | ../modules/container_registry | n/a |
| <a name="module_shared_resource_group"></a> [shared\_resource\_group](#module\_shared\_resource\_group) | ../modules/resource_group | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../modules/storage_account | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Azure region for shared resources. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure subscription ID. | `string` | n/a | yes |
| <a name="input_acr_sku"></a> [acr\_sku](#input\_acr\_sku) | SKU for the Azure Container Registry. | `string` | `"Basic"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_admin_password"></a> [acr\_admin\_password](#output\_acr\_admin\_password) | The admin password for the shared Azure Container Registry. |
| <a name="output_acr_admin_username"></a> [acr\_admin\_username](#output\_acr\_admin\_username) | The admin username for the shared Azure Container Registry. |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | The ID of the shared Azure Container Registry. |
| <a name="output_acr_login_server"></a> [acr\_login\_server](#output\_acr\_login\_server) | The login server URL of the shared Azure Container Registry. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the shared resource group. |
<!-- END_TF_DOCS -->
