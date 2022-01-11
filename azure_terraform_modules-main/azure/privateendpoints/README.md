# Create Private Endpoints in Azure

This layer allows you to create and manage one or multiple Private Endpoints in Microsoft Azure.

## Features

This layer will:

- Create one or multiple Private Endpoints in Microsoft Azure.
- Integrate private DNS zones with private endpoint.
- Associates Private Endpoints to respective resources.

### NOTE

- Private DNS zone Integration with private endpoint will let you create A records automatically only for azure services like storage, keyvault, AMPLS e.t.c . 

- Don't delete the A records manually which are created as part of DNS zone integration with private endpoint. As current azurerm provider won't be able to recreate them in the next terraform apply.(In case if A record has been manually deleted, Terraform wouldn't be able to recreate it)
[Reference](https://github.com/terraform-providers/terraform-provider-azurerm/issues/7726)

## Usage

```
- name: privateendpoints
  type: privateendpoints
  version: "1.2.0"
  dependencies:
    networking: networking
    keyvault: keyvault
    storage: storage
    azsql: azsql
    mysql: mysql
```

## Example

Please refer Example directory to consume this layer into your application.

- [var-privateendpoints.auto.tfvars](./var-privateendpoints.auto.tfvars) contains the variable defination or actual values for respective variables which are passed to the resource group layer.

## Best practices for variable declaration/defination

- All names of the Resources should be defined as per standard naming conventions.

- While declaring variables with data type 'map(object)' or 'object; or 'list(object)', It's mandatory to define all the attributes in object. If you don't want to set any attribute then define its value as null or empty list([]) or empty map({}) as per the object data type.

- Please make sure all the Required parameters are set. Refer below section to understand the required and optional input values when using this module.

- Please verify that the values provided to the variables are in comfort with the allowed values for that variable. Refer below section to understand the allowed values for each variable when using this module.

## Inputs

### **Required Parameters**

These variables must be set in the `/var-privateendpoints.auto.tfvars` file when using this module.

#### resource_group_name `string`

    Description: Specifies the name of the resource group in which to create the Private Endpoint.

#### external_resource_ids `map(string)`

    Description: Specifies the Map of bastion/external resource ids.

    Default: {}

#### resource_ids `map(string)`

    Description: Specifies the Map of private link service resource id's.

    Default: {}

#### private_endpoints `map(object({}))`

    Description: Specifies the Map of objects containing attributes for Private Endpoints.

    Default: {}

| Attribute                 |  Data Type   | Field Type | Description                                                                                                                                                                                                                                                         | Allowed Values |
| :------------------------ | :----------: | :--------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------------- |
| name                      |    string    |  Required  | Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created.                                                                                                                                                                      |                |
| subnet_name               |    string    |  Required  | Specifies the name of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created.                                                                                                    |                |
| vnet_name                 |    string    |  Optional  | Specifies the name of the VNet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created.                                                                                                      |                |
| networking_resource_group |    string    |  Optional  | Specifies the resource group of the VNet/Subnet from which Private IP Addresses will be allocated for this Private Endpoint.                                                                                                                                        |                |
| resource_name             |    string    |  Required  | Specifies the name of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. Changing this forces a new resource to be created.                                                                                               |                |
| group_ids                 | list(string) |  Optional  | A list of subresource names which the Private Endpoint is able to connect to. Changing this forces a new resource to be created.                                                                                                                                    |                |
| approval_required         |     bool     |  Optional  | Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created.                                                                                                                                | true, false    |
| approval_message          |    string    |  Optional  | A message passed to the owner of the remote resource when the private endpoint attempts to establish the connection to the remote resource. The request message can be a maximum of 140 characters in length. Only valid if **_approval_required_** is set to true. |                |
| dns_zone_names          |    list(string)    |  Optional  | List of private DNS zone names to integrate with PE |                |
| dns_zone_group_name    |    string    |  Optional  |private  DNS group name required while integrating private DNS zone with PE |                |

#### pe_mandatory_tags `map(string)`

    Description: A mapping of tags to assign to the resource. Specifies additional Private Endpoint resources tags, in addition to the resource group tags.

    Default: {}

### **Optional Parameters**

## Outputs

#### private_endpoint_ids

    Description: The list of Private Endpoint Id's.

#### private_ip_addresses

    Description: The list of Private Endpoint IP Addresses.

## Reference

[azurerm_private_endpoint](https://www.terraform.io/docs/providers/azurerm/r/private_endpoint.html) <br />

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.59.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.87.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_endpoint.private_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |
| [azurerm_private_endpoint_connection.pe_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_endpoint_connection) | data source |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_approval_message"></a> [approval\_message](#input\_approval\_message) | A message passed to the owner of the remote resource when the private endpoint attempts to establish the connection to the remote resource | `string` | `"Please approve my private endpoint connection request"` | no |
| <a name="input_pe_mandatory_tags"></a> [pe\_mandatory\_tags](#input\_pe\_mandatory\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_private_endpoints"></a> [private\_endpoints](#input\_private\_endpoints) | Map containing Private Endpoint and Private DNS Zone details | <pre>map(object({<br>    name                      = string<br>    subnet_id                 = string<br>    # subnet_name               = string<br>    # vnet_name                 = string<br>    # networking_resource_group = string<br>    resource_name             = string<br>    group_ids                 = list(string)<br>    approval_required         = bool<br>    approval_message          = string<br>    dns_zone_names            = list(string)<br>    dns_zone_group_name       = string <br>    dns_rg_name               = string<br>    private_connection_address_id = string<br>  }))</pre> | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group name of private endpoint. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_endpoint_ids"></a> [private\_endpoint\_ids](#output\_private\_endpoint\_ids) | Private Endpoint Id's |
| <a name="output_private_ip_addresses_acr_map"></a> [private\_ip\_addresses\_acr\_map](#output\_private\_ip\_addresses\_acr\_map) | Map of Private Endpoint IP Addresses for ACR |
| <a name="output_private_ip_addresses_map"></a> [private\_ip\_addresses\_map](#output\_private\_ip\_addresses\_map) | Map of Private Endpoint IP Addresses |
