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
| [azurerm_network_watcher.az_network_watcher](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher) | resource |
| [azurerm_network_watcher_flow_log.az_network_watcher_flow_log](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_watcher_flow_log) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_az_network_watcher_flow_log_retention_policy_days"></a> [az\_network\_watcher\_flow\_log\_retention\_policy\_days](#input\_az\_network\_watcher\_flow\_log\_retention\_policy\_days) | The number of retention days if the retention policy is enabled | `number` | `90` | no |
| <a name="input_az_network_watcher_flow_log_sequence"></a> [az\_network\_watcher\_flow\_log\_sequence](#input\_az\_network\_watcher\_flow\_log\_sequence) | The suffix sequence for the Network Watcher Flow Log to be provisioned. The sequence number should always be checked from the Azure portal and incremented. | `number` | n/a | yes |
| <a name="input_az_nsg_id"></a> [az\_nsg\_id](#input\_az\_nsg\_id) | The Network Security Group id where the Network Watcher Flow Log should be provisioned. | `string` | n/a | yes |
| <a name="input_az_storage_account_data_id"></a> [az\_storage\_account\_data\_id](#input\_az\_storage\_account\_data\_id) | The storage account id, which will be picked from data resource where the module is called | `string` | n/a | yes |
| <a name="input_az_storage_account_name"></a> [az\_storage\_account\_name](#input\_az\_storage\_account\_name) | The Storage Account name where the Network Watcher Flow Log should be provisioned. | `string` | n/a | yes |
| <a name="input_az_storage_account_resource_group_name"></a> [az\_storage\_account\_resource\_group\_name](#input\_az\_storage\_account\_resource\_group\_name) | The Storage Account Resource Group name | `string` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_create_network_watcher"></a> [create\_network\_watcher](#input\_create\_network\_watcher) | Whether to create a network wacther and use it for Network Watcher Flow Logs. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision. | `string` | n/a | yes |
| <a name="input_is_network_watcher_flow_log_retention_policy_enabled"></a> [is\_network\_watcher\_flow\_log\_retention\_policy\_enabled](#input\_is\_network\_watcher\_flow\_log\_retention\_policy\_enabled) | Is retention policy enabled for Network Watcher Flow Log | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_location_abbreviation"></a> [location\_abbreviation](#input\_location\_abbreviation) | The abbreviation of Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | The Operational Company for which the resorces are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources to be provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project in which the resources are provisioned | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_network_watcher_flow_log_id_output"></a> [az\_network\_watcher\_flow\_log\_id\_output](#output\_az\_network\_watcher\_flow\_log\_id\_output) | ID of new Network Watcher Flow Log created. |
| <a name="output_az_network_watcher_flow_log_name_output"></a> [az\_network\_watcher\_flow\_log\_name\_output](#output\_az\_network\_watcher\_flow\_log\_name\_output) | Name of new Network Watcher Flow Log created. |

## Expected 

```
az_network_watcher_flow_log_id_output = "/subscriptions/xxx/resourceGroups/NetworkWatcherRG/providers/Microsoft.Network/networkWatchers/NetworkWatcher_uaenorth/networkSecurityGroupId/subscriptions/xxx/resourceGroups/demo-iac-rg/providers/Microsoft.Network/networkSecurityGroups/nsg"

az_network_watcher_flow_log_name_output = "Microsoft.Networkdemo-iac-rgnsg"
```
<!-- END_TF_DOCS -->
