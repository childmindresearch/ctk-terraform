<!-- BEGIN_TF_DOCS -->
# Cosmos DB PostgreSQL

Provisions a Cosmos DB for PostgreSQL cluster accessible only via a private endpoint, with a private DNS zone for name resolution and the administrator password stored in Key Vault.

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
| [azurerm_cosmosdb_postgresql_cluster.cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_postgresql_cluster) | resource |
| [azurerm_private_dns_zone.cosmos_postgres](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.cosmos_postgres](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.cosmos_postgres](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | Administrator password for the Cosmos DB PostgreSQL cluster. | `string` | n/a | yes |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name of the environment. | `string` | n/a | yes |
| <a name="input_private_endpoint_subnet_id"></a> [private\_endpoint\_subnet\_id](#input\_private\_endpoint\_subnet\_id) | The private endpoint's subnet ID. | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Name of the region to put the Cosmos DB cluster in. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group. | `string` | n/a | yes |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id) | ID of the virtual network. | `string` | n/a | yes |
| <a name="input_coordinator_server_edition"></a> [coordinator\_server\_edition](#input\_coordinator\_server\_edition) | The server edition for the coordinator node. | `string` | `"BurstableMemoryOptimized"` | no |
| <a name="input_coordinator_storage_quota_in_mb"></a> [coordinator\_storage\_quota\_in\_mb](#input\_coordinator\_storage\_quota\_in\_mb) | Storage quota in MB for the coordinator node. | `number` | `32768` | no |
| <a name="input_coordinator_vcore_count"></a> [coordinator\_vcore\_count](#input\_coordinator\_vcore\_count) | Number of vCores for the coordinator node. | `number` | `1` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of worker nodes in the cluster. | `number` | `0` | no |
| <a name="input_node_server_edition"></a> [node\_server\_edition](#input\_node\_server\_edition) | The server edition for the worker nodes. | `string` | `"GeneralPurpose"` | no |
| <a name="input_node_storage_quota_in_mb"></a> [node\_storage\_quota\_in\_mb](#input\_node\_storage\_quota\_in\_mb) | Storage quota in MB for each worker node. | `number` | `524288` | no |
| <a name="input_node_vcores"></a> [node\_vcores](#input\_node\_vcores) | Number of vCores for each worker node. | `number` | `2` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_administrator_login"></a> [administrator\_login](#output\_administrator\_login) | The administrator login name (always 'citus' for Cosmos DB PostgreSQL). |
| <a name="output_administrator_password"></a> [administrator\_password](#output\_administrator\_password) | The administrator password. |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The ID of the Cosmos DB PostgreSQL cluster. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the Cosmos DB PostgreSQL cluster. |
| <a name="output_host"></a> [host](#output\_host) | The connection endpoint for the Cosmos DB PostgreSQL cluster. |
| <a name="output_port"></a> [port](#output\_port) | The PostgreSQL port. |
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->