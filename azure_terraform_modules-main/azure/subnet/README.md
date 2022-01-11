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
| [azurerm_subnet.az_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.az_subnet_network_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.az_subnet_network_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_nsg_id"></a> [az\_nsg\_id](#input\_az\_nsg\_id) | The NSG's id to which the Subnet/s have to be associated. | `string` | n/a | yes |
| <a name="input_az_resource_group_name"></a> [az\_resource\_group\_name](#input\_az\_resource\_group\_name) | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | n/a | yes |
| <a name="input_az_route_table_id"></a> [az\_route\_table\_id](#input\_az\_route\_table\_id) | The Route Table's id to which the Subnet/s have to be associated. | `string` | n/a | yes |
| <a name="input_az_subnet_cidr"></a> [az\_subnet\_cidr](#input\_az\_subnet\_cidr) | The CIDR range of the Subnet/s that should be created in the new Vnet.<br>  Enter comma separated values of Subnet/s CIDR if more than one Subnet is needed.<br>  example: 10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24 | `string` | n/a | yes |
<<<<<<< HEAD
=======
| <a name="input_az_subnet_sequence"></a> [az\_subnet\_sequence](#input\_az\_subnet\_sequence) | The suffix sequence for the Subnet/s to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented. | `string` | n/a | yes |
>>>>>>> sequence
| <a name="input_az_vnet_name"></a> [az\_vnet\_name](#input\_az\_vnet\_name) | The name of the virtual network to which to attach the subnet | `string` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision.<br>Expected values are: dev,prod,sandbox,UAT,test | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_location_abbreviation"></a> [location\_abbreviation](#input\_location\_abbreviation) | The abbreviation of Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | The Operational Company for which the resorces are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project in which the resources are provisioned | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_subnet_id_output"></a> [az\_subnet\_id\_output](#output\_az\_subnet\_id\_output) | List of ID/s of new Subnet/s created. |
| <a name="output_az_subnet_name_output"></a> [az\_subnet\_name\_output](#output\_az\_subnet\_name\_output) | List Name/s of new Subnet/s created. |

## Expected 

```
az_subnet_id_output = toset([
  "/subscriptions/xxx/resourceGroups/demo-iac-rg/providers/Microsoft.Network/virtualNetworks/vnet-dev-un-001/subnets/snet-dev-un-001",
  "/subscriptions/xxx/resourceGroups/demo-iac-rg/providers/Microsoft.Network/virtualNetworks/vnet-dev-un-001/subnets/snet-dev-un-002",
  "/subscriptions/xxx/resourceGroups/demo-iac-rg/providers/Microsoft.Network/virtualNetworks/vnet-dev-un-001/subnets/snet-dev-un-003",
])
az_subnet_name_output = toset([
  "snet-dev-un-001",
  "snet-dev-un-002",
  "snet-dev-un-003",
])
```

<<<<<<< HEAD

=======
>>>>>>> sequence
<!-- END_TF_DOCS -->
