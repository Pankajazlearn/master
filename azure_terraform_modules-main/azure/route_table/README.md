<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.0.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | = 2.90.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | = 2.90.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_route_table.az_route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |


## Medata Tags
Listed below are the tags the tags for Azure Route Table resource.
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision.<br>Expected values are: dev,prod,sandbox,UAT,test | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | The Operational Company for which the resorces are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project in which the resources are provisioned | `string` | n/a | yes |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_resource_group_name"></a> [az\_resource\_group\_name](#input\_az\_resource\_group\_name) | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | n/a | yes |
| <a name="input_az_route_table_name"></a> [az\_route\_table\_name](#input\_az\_route\_table\_name) | The name of the route table to be created | `string` | n/a | yes |
| <a name="input_az_route_table_routes"></a> [az\_route\_table\_routes](#input\_az\_route\_table\_routes) | Routes of route table | `list(map(string))` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where all resources in this provision should be created | `string` | n/a | yes |


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_route_table_id_output"></a> [az\_route\_table\_id\_output](#output\_az\_route\_table\_id\_output) | ID of new Route Table created |
| <a name="output_az_route_table_name_output"></a> [az\_route\_table\_name\_output](#output\_az\_route\_table\_name\_output) | Name of new Route Table created |

## Expected 

```
az_route_table_id_output = "/subscriptions/xxx/resourceGroups/demo-iac-rg/providers/Microsoft.Network/routeTables/rtable"

az_route_table_name_output = "route-route-table"
```

<!-- END_TF_DOCS -->
