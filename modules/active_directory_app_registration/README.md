<!-- BEGIN_TF_DOCS -->
# Active Directory App Registration

Registers an Azure AD application with a service principal, client secret, and owner assignments; both the app and service principal have `prevent_destroy` lifecycle guards.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_application.app](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_application_password.secret](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application_password) | resource |
| [azuread_service_principal.sp](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azuread_group.owner_group](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | The display name for the application. | `string` | n/a | yes |
| <a name="input_owner_group_object_id"></a> [owner\_group\_object\_id](#input\_owner\_group\_object\_id) | Object ID of the owner group of these resources. | `string` | n/a | yes |
| <a name="input_redirect_uris"></a> [redirect\_uris](#input\_redirect\_uris) | A set of redirect URIs for the application. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | The client ID of the Azure AD application. |
| <a name="output_client_secret"></a> [client\_secret](#output\_client\_secret) | The client secret of the Azure AD application. |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | The Azure AD tenant ID. |
<!-- END_TF_DOCS -->
<!-- END_TF_DOCS -->