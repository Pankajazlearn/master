<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.0.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | = 2.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =2.71.0 |


## Resources

| Name | Type |
|------|------|
| azurerm_eventhub.az_eventhub| resource |
| azurerm_eventhub_namespace.az_eventhub_namespace| resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_name"></a> [application\_name](#input\_application\_name) | The application for which the Eventhub is provisioned | `string` | n/a | yes |
| <a name="input_az_eventhub_namespace_name"></a> [az\_eventhub\_namespace\_name](#input\_az\_eventhub\_namespace\_name) | An existing Eventhub namespace where the Eventhub should be provisioned. To be left blank if a new Resource Group has to be created. | `string` | `""` | no |
| <a name="input_az_resource_group_name"></a> [az\_resource\_group\_name](#input\_az\_resource\_group\_name) | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_create_eventhub_namespace"></a> [create\_eventhub\_namespace](#input\_create\_eventhub\_namespace) | Whether to create Eventhub Namespace and use it for Eventhub resource. | `bool` | `false` | no |
| <a name="input_create_resource_group"></a> [create\_resource\_group](#input\_create\_resource\_group) | Whether to create resource group and use it for Virtual Network resource. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision.<br>Expected values are: dev,prod,sandbox,UAT,test | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_location_abbreviation"></a> [location\_abbreviation](#input\_location\_abbreviation) | The abbreviation of Azure location where all resources in this provision should be created | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | The Operational Company for which the resorces are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources to be provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_az_eventhub_namespace_sequence"></a> [az_eventhub_namespace_sequence](#input\_project) | The sequence to be added in the Eventhub Namespace's name to be created. | `string` | n/a | yes |
| <a name="input_az_eventhub_sequence"></a> [az_eventhub_sequence](#input\_project) | The sequence to be added in the Eventhub's name to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_eventhub_id_output"></a> [az\_eventhub\_id\_output](#output\_az\_eventhub\_id\_output) | --------------------------- New Eventhub ID --------------------------- |
| <a name="output_az_eventhub_name_output"></a> [az\_eventhub\_name\_output](#output\_az\_eventhub\_name\_output) | --------------------------- New Eventhub Name --------------------------- |
| <a name="output_az_eventhub_namespace_output"></a> [az\_eventhub\_namespace\_output](#output\_az\_eventhub\_namespace\_output) | ---------------------------- New Eventhub Namespace ---------------------------- |

## Expected
```
az_eventhub_id_output = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.EventHub/namespaces/xxx/eventhubs/ehub-xxx-wvd-001"
az_eventhub_name_output = "ehub-xxx-wvd-001"
az_eventhub_namespace_output = <sensitive>
```

<!-- END_TF_DOCS -->
