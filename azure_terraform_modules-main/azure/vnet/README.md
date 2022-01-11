<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.0.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | = 2.90.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.90.0 |


## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.az_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_network.az_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.az_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_dns_servers"></a> [az\_dns\_servers](#input\_az\_dns\_servers) | List of IP addresses of DNS servers | `list(string)` | n/a | yes |
| <a name="input_az_resource_group_name"></a> [az\_resource\_group\_name](#input\_az\_resource\_group\_name) | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | n/a | yes |
| <a name="input_az_vnet_cidr"></a> [az\_vnet\_cidr](#input\_az\_vnet\_cidr) | The CIDR range of Virtual Network that should be created | `list(string)` | n/a | yes |
| <a name="input_az_resource_group_sequence"></a> [az\_resource\_group\_sequence](#input\_az\_resource\_group\_sequence) | The suffix sequence for the Resource Group if created. The sequence number should always be checked from the Azure portal and incremented/decremented. | `string` | "" | no |
| <a name="input_az_vnet_sequence"></a> [az\_vnet\_sequence](#input\_az\_vnet\_sequence) | The suffix sequence for the Vnet to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented. | `string` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for Virtual Network resource. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision.<br>Expected values are: dev,prod,sandbox,UAT,test | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_location_abbreviation"></a> [location\_abbreviation](#input\_location\_abbreviation) | The abbreviation of Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | The Operational Company for which the resorces are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources to be provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project in which the resources are provisioned | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
<<<<<<< HEAD
| <a name="output_az_vnet_resource_group_name_output"></a> [az_vnet_resource_group_name_output](#output\_az\_new\_resource\_group\_name\_output) | Name of Virtual Network's Resource Group |
| <a name="output_az_virtual_network_id_output"></a> [az\_virtual\_network\_id\_output](#output\_az\_virtual\_network\_id\_output) | Name of new Virtual Network created |
| <a name="output_az_virtual_network_name_output"></a> [az\_virtual\_network\_name\_output](#output\_az\_virtual\_network\_name\_output) | ID of new Virtual Network created |

## Expected
```
az_resource_group_output = []
az_virtual_network_output = {
  "address_space" = tolist([
    ...
  ])
  "bgp_community" = ""
  "dns_servers" = tolist([
    ...
  ])
  "flow_timeout_in_minutes" = 0
  "guid" = "xxx"
  "id" = "/subscriptions/xxx/virtualNetworks/vnet-dev-xxx-001"
  "location" = "westeurope"
  "name" = "vnet-dev-westeurope-001"
  "resource_group_name" = "test-xxx-rg"
  "subnet" = toset([])
  "tags" = tomap({
    "BusinessUnit" = "business"
    "Description" = "A Virtual network is created in the test-xxx-rg."
    "Environment" = "dev"
    "Name" = "vnet-dev-westeurope-001"
    "OpCo" = "xxxp"
    "Owner" = "example@xxx.au"
    "Project" = "project1"
  })
  "timeouts" = null /* object */
  "vm_protection_enabled" = false
}
=======
| <a name="output_az_virtual_network_id_output"></a> [az\_virtual\_network\_id\_output](#output\_az\_virtual\_network\_id\_output) | Name of new Virtual Network created |
| <a name="output_az_virtual_network_name_output"></a> [az\_virtual\_network\_name\_output](#output\_az\_virtual\_network\_name\_output) | ID of new Virtual Network created |
| <a name="output_az_vnet_resource_group_name_output"></a> [az\_vnet\_resource\_group\_name\_output](#output\_az\_vnet\_resource\_group\_name\_output) | Name of Virtual Network's Resource Group |

## Expected
```
az_virtual_network_id_output       = "/subscriptions/xxx/virtualNetworks/vnet-dev-xxx-009"
az_virtual_network_name_output     = "vnet-dev-un-009"
az_vnet_resource_group_name_output = "test-examples"
>>>>>>> sequence

```

<!-- END_TF_DOCS -->
