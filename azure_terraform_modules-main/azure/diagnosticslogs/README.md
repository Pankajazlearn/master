# Create Diagnostic Logs in Azure.

    This layer allows you to create diagnostic logs for resources in azure.
    Resources like: applicationgateway, keyvault, cosmosdb, mysql, azsql, aks, appservice, postgresqldb

## Features

1.  Create Storage Diagnostics for resources in Azure.
2.  Create Log Analytics Workspace Diagnostics for resources in Azure.
3.  Create Event Hub Diagnostics for resources in Azure.

## usage

```
- name: diagnosticlogs
  type: diagnosticlogs
  dependencies:
    storage: storage
    loganalytics: loganalytics
    eventhub: eventhub
    applicationgateway: applicationgateway
    keyvault: keyvault
    cosmosdb: cosmosdb
    mysql: mysql
    azsql: azsql
    aks: aks
    appservice: appservice
    postgresqldb: postgresqldb
```

## Example

Please refer Example directory to consume this layer into your application.

- [var-diagnosticlogs.auto.tfvars](./var-diagnosticlogs.auto.tfvars) contains the variable defination or actual values for respective variables.

## Best practices for variable declarations

1.  All names of the Resources should be defined as per standard naming conventions.

2.  Please make sure all the Required parameters are declared. Refer below section to understand the required and optional parameters of this layer.

3.  Please verify that the values provided to the variables are with in the allowed values.Refer below section to understand the allowed values to each parameter.

## Inputs

### **Required Parameters**

These variables must be set in the `/var-diagnosticlogs.auto.tfvars` file when using this layer.

#### diagnostic_setting_name `string`

    Description: The name of the diagnostic setting.

#### resource_id `string`

    Description: The ID of the resource on which activate the diagnostic settings.
    
#### log_categories `list(string)`
  
    Description = List of log categories.
    Default     = null

#### metric_categories `list(string)`

    Description = List of metric categories.
    Default     = null

#### retention_days `number`
  
    Description = "The number of days to keep diagnostic logs."
    Default     = 30

#### logs_destinations_ids `list(string)`
  
    Description = "List of destination resources IDs for logs diagnostic destination. Can be Storage Account, Log Analytics Workspace and Event Hub. No more than one of each can be set."
}

#### log_analytics_destination_type `string`
  
    Description = "When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specifc       tables, instead of the legacy AzureDiagnostics table. Azure Data Factory is the only compatible resource so far."
    Default     = "AzureDiagnostics"
}

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_diagnostic_settings_id"></a> [diagnostic\_settings\_id](#output\_diagnostic\_settings\_id) | ID of the Diagnostic Settings. 

## Reference

[azurerm_monitor_diagnostic_setting](https://www.terraform.io/docs/providers/azurerm/r/monitor_diagnostic_setting.html)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.59.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.89.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.diagnostic_setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_categories.diagnostic_logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_diagnostic_setting_name"></a> [diagnostic\_setting\_name](#input\_diagnostic\_setting\_name) | The name of the diagnostic setting. | `string` | `"mysql-audit-logs"` | no |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | When set to 'Dedicated' logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. Azure Data Factory is the only compatible resource so far. | `string` | `"AzureDiagnostics"` | no |
| <a name="input_log_categories"></a> [log\_categories](#input\_log\_categories) | List of log categories. | `list(string)` | `null` | no |
| <a name="input_logs_destinations_ids"></a> [logs\_destinations\_ids](#input\_logs\_destinations\_ids) | List of destination resources IDs for logs diagnostic destination. Can be Storage Account, Log Analytics Workspace and Event Hub. No more than one of each can be set. | `list(string)` | n/a | yes |
| <a name="input_metric_categories"></a> [metric\_categories](#input\_metric\_categories) | List of metric categories. | `list(string)` | `null` | no |
| <a name="input_resource_id"></a> [resource\_id](#input\_resource\_id) | The ID of the resource on which activate the diagnostic settings. | `string` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | The number of days to keep diagnostic logs. | `number` | `30` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_diagnostic_settings_id"></a> [diagnostic\_settings\_id](#output\_diagnostic\_settings\_id) | ID of the Diagnostic Settings. |
