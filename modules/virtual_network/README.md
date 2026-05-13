<!-- BEGIN_TF_DOCS -->
# Virtual Network

Creates a VNet with three subnets: one for container apps (Key Vault service endpoint), one for database private endpoints, and one for storage (Storage + Key Vault service endpoints).

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
| [azurerm_subnet.container_apps](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name of the environment. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Name of the region to put the virtual network in. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group. | `string` | n/a | yes |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Address space for the virtual network. | `list(string)` | <pre>[<br/>  "10.0.0.0/16"<br/>]</pre> | no |
| <a name="input_container_apps_subnet_address_prefixes"></a> [container\_apps\_subnet\_address\_prefixes](#input\_container\_apps\_subnet\_address\_prefixes) | Address prefixes for the container apps subnet. | `list(string)` | <pre>[<br/>  "10.0.0.0/23"<br/>]</pre> | no |
| <a name="input_database_subnet_address_prefixes"></a> [database\_subnet\_address\_prefixes](#input\_database\_subnet\_address\_prefixes) | Address prefixes for the database subnet. | `list(string)` | <pre>[<br/>  "10.0.2.0/24"<br/>]</pre> | no |
| <a name="input_storage_subnet_address_prefixes"></a> [storage\_subnet\_address\_prefixes](#input\_storage\_subnet\_address\_prefixes) | Address prefixes for the storage subnet. | `list(string)` | <pre>[<br/>  "10.0.3.0/24"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_apps_subnet_id"></a> [container\_apps\_subnet\_id](#output\_container\_apps\_subnet\_id) | The ID of the container apps subnet. |
| <a name="output_database_subnet_id"></a> [database\_subnet\_id](#output\_database\_subnet\_id) | The ID of the database subnet. |
| <a name="output_storage_subnet_id"></a> [storage\_subnet\_id](#output\_storage\_subnet\_id) | The ID of the storage subnet. |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The ID of the Virtual Network. |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The name of the Virtual Network. |
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->