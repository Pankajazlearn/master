## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.59.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_Private_endpoints"></a> [Private\_endpoints](#module\_Private\_endpoints) | ../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_approval_message"></a> [approval\_message](#input\_approval\_message) | A message passed to the owner of the remote resource when the private endpoint attempts to establish the connection to the remote resource | `string` | `"Please approve my private endpoint connection request"` | no |
| <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints) | Map containing Private Endpoint and Private DNS Zone details | <pre>map(object({<br>    name                      = string<br>    subnet_id                 = string<br>    subnet_name               = string<br>    vnet_name                 = string<br>    networking_resource_group = string<br>    resource_name             = string<br>    group_ids                 = list(string)<br>    approval_required         = bool<br>    approval_message          = string<br>    dns_zone_names            = list(string)<br>    dns_zone_group_name       = string <br>    dns_rg_name               = string<br>    private_connection_address_id = string<br>  }))</pre> | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group name of private endpoint. | `string` | `null` | no |
| <a name="input_tag_BusinessUnit"></a> [tag\_BusinessUnit](#input\_tag\_BusinessUnit) | Private Endpoint tag BusinessUnit | `string` | n/a | yes |
| <a name="input_tag_Confidentiality"></a> [tag\_Confidentiality](#input\_tag\_Confidentiality) | Private Endpoint tag confidentiality | `string` | n/a | yes |
| <a name="input_tag_Environment"></a> [tag\_Environment](#input\_tag\_Environment) | Private Endpoint tag Environment | `string` | n/a | yes |
| <a name="input_tag_OpCo"></a> [tag\_OpCo](#input\_tag\_OpCo) | Private Endpoint tag OpCo | `string` | n/a | yes |
| <a name="input_tag_Owner"></a> [tag\_Owner](#input\_tag\_Owner) | Private Endpoint tag Owner | `string` | n/a | yes |
| <a name="input_tag_Project"></a> [tag\_Project](#input\_tag\_Project) | Private Endpoint tag Project | `string` | n/a | yes |

## Outputs

No outputs.
