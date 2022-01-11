## Azure Linux virtual Machine Backup Module
- vm_backup modules contains Recovery service vault with its backup policy with all the parameters variablized.
## Resources
| Name | Type |
|------|------|
| [azurerm_backup_policy_vm.az_backup_policy_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_policy_vm) | resource |
| [azurerm_backup_protected_vm.backup_protected_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/backup_protected_vm) | resource |
| [azurerm_recovery_services_vault.az_recovery_service_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/recovery_services_vault) | resource |
## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Provide the environment name under the resources are provisioned | `string` | `""` | no |
| <a name="input_frequency"></a> [frequency](#input\_frequency) | Provide the frequency of the virtual machine backup | `string` | `""` | no |
| <a name="input_instant_retention_days"></a> [instant\_retention\_days](#input\_instant\_retention\_days) | Provide the number instant restore retention days | `number` | `5` | no |
| <a name="input_location"></a> [location](#input\_location) | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | `""` | no |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | Provide the Opeartional Company name under which the resources are provisioned | `string` | `""` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | `""` | no |
| <a name="input_project"></a> [project](#input\_project) | Provide the project name code of the Business Unit under which the resources are provisioned | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | `""` | no |
| <a name="input_retention_daily"></a> [retention\_daily](#input\_retention\_daily) | Provide the number of daily retentions | `number` | `30` | no |
| <a name="input_retention_monthly"></a> [retention\_monthly](#input\_retention\_monthly) | Provide the number of monthly retentions | `number` | `60` | no |
| <a name="input_soft_delete_enabled"></a> [soft\_delete\_enabled](#input\_soft\_delete\_enabled) | Soft delete option for the Recovery service vault | `bool` | `""` | no |
| <a name="input_time"></a> [time](#input\_time) | Provide the time for the daily virtual machine backup | `string` | `""` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Provide the timezone of the virtual machine backup | `string` | `""` | no |
| <a name="input_virtual_machine_id"></a> [virtual\_machine\_id](#input\_virtual\_machine\_id) | n/a | `any` | n/a | yes |
| <a name="input_weekdays"></a> [weekdays](#input\_weekdays) | Provide the weekdays for the virtual machine backup | `list(string)` | <pre>[<br>  "Sunday",<br>  "Monday",<br>  "Tuesday",<br>  "Wednesday",<br>  "Thursday",<br>  "Friday",<br>  "Saturday"<br>]</pre> | no |
| <a name="input_weeks"></a> [weeks](#input\_weeks) | Provide the weeks for the virtual machine backup | `list(string)` | <pre>[<br>  "First",<br>  "Second",<br>  "Third",<br>  "Fourth",<br>  "Last"<br>]</pre> | no |
## Outputs
| Name | Description |
|------|-------------|
| <a name="output_az_recovery_service_vault"></a> [az\_recovery\_service\_vault](#output\_az\_recovery\_service\_vault) | The output of the Azure Recovery service vault |
| <a name="output_az_recovery_service_vault_policy"></a> [az\_recovery\_service\_vault\_policy](#output\_az\_recovery\_service\_vault\_policy) | The output of the Azure Recovery service vault policy |

## Expected 

```
az_vm_backup = {
"az_recovery_service_vault" = {
"id" = "/subscriptions/xxx/vaults/rsv-project1-dev-01"
"identity" = tolist([])
"location" = "uaenorth"
"name" = "rsv-project1-dev-01"
"resource_group_name" = "xxx-resource-group"
"sku" = "Standard"
"soft_delete_enabled" = true
"tags" = tomap({
"BusinessUnit" = "business"
"Description" = "A Recovery service vault is created in the xxx-resource-group."
"Environment" = "dev"
"Name" = "rsv-project1-dev-01"
"OpCO" = "xxxp"
"Owner" = "xxx"
"Project" = "project1"
})
"timeouts" = null /* object */
}
"az_recovery_service_vault_policy" = {
"backup" = tolist([
{
"frequency" = "Daily"
"time" = "22:00"
"weekdays" = toset(null) /* of string */
},
])
```