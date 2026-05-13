<!-- BEGIN_TF_DOCS -->
# Container Registry

Provisions an Azure Container Registry (ACR) with admin access enabled and a `prevent_destroy` lifecycle guard.

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
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name of the environment (e.g., dev, prod). | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Name of the region to create the container registry in. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to create the container registry in. | `string` | n/a | yes |
| <a name="input_acr_sku"></a> [acr\_sku](#input\_acr\_sku) | SKU of the Azure Container Registry. | `string` | `"Basic"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_password"></a> [admin\_password](#output\_admin\_password) | The admin password for the Azure Container Registry. |
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The admin username for the Azure Container Registry. |
| <a name="output_container_registry_id"></a> [container\_registry\_id](#output\_container\_registry\_id) | The ID of the Azure Container Registry. |
| <a name="output_container_registry_login_server"></a> [container\_registry\_login\_server](#output\_container\_registry\_login\_server) | The login server URL of the Azure Container Registry. |
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->