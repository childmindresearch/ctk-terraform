<!-- BEGIN_TF_DOCS -->
# Development Environment

Root configuration for the `dev` environment; instantiates the `environment` module with dev-specific domain and AD settings, referencing shared state for ACR outputs.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =4.1.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dev_environment"></a> [dev\_environment](#module\_dev\_environment) | ../modules/environment | n/a |

## Resources

| Name | Type |
|------|------|
| [terraform_remote_state.shared](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Name of the region to put the resource group in. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure Subscription ID. | `string` | n/a | yes |
| <a name="input_cloai_model"></a> [cloai\_model](#input\_cloai\_model) | CLOAI model to use. | `string` | `"opus-4.6-v1"` | no |
| <a name="input_cloai_service_image_tag"></a> [cloai\_service\_image\_tag](#input\_cloai\_service\_image\_tag) | Tag of the cloai-service container image to deploy. | `string` | `"latest"` | no |
| <a name="input_ctk_functions_image_tag"></a> [ctk\_functions\_image\_tag](#input\_ctk\_functions\_image\_tag) | Tag of the ctk-functions container image to deploy. | `string` | `"latest"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project. | `string` | `"ctk"` | no |
| <a name="input_webapp_image_tag"></a> [webapp\_image\_tag](#input\_webapp\_image\_tag) | Tag of the webapp container image to deploy. | `string` | `"latest"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
