<!-- BEGIN_TF_DOCS -->
# Eventhub 

Configuration in this directory creates an Azure Eventhub Namespace and Eventhub resource. The creation of a Eventhub Namespace is `false` by default.

## Module Usage

Following example to create an Azure Eventhub Namespace and Eventhub resource.

### `main.tf`
```hcl
module "az_eventhub" {
    source = "../../"

    environment         = var.environment
    owner               = var.owner
    business_unit       = var.business_unit
    project             = var.project
    operational_company = var.operational_company
    
    location              = var.location
    location_abbreviation = var.location_abbreviation

    az_resource_group_name                   = var.az_resource_group_name
    az_eventhub_namespace_name               = var.az_eventhub_namespace_name
    application_name                         = var.application_name
    az_eventhub_sequence                     = var.az_eventhub_sequence
    az_eventhub_partition_count              = var.az_eventhub_partition_count
    az_eventhub_message_retention            = var.az_eventhub_message_retention
}
```

### `variables.auto.tfvars`
```hcl
environment            = "dev"
project                = "example"
owner                  = "example@mail.ae"
business_unit          = "BU"
operational_company    = "OpCo"
location               = "uaenorth"
location_abbreviation  = "un"

az_eventhub_namespace_name               = "evhns-OpCo-un-009"
az_resource_group_name                   = "test-examples"
application_name                         = "app"
az_eventhub_sequence                     = "001"
az_eventhub_partition_count              = "2"
az_eventhub_message_retention            = "7"

```

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_eventhub_output"></a> [az\_eventhub\_output](#output\az\_eventhub\_output) | Name and ID of new Eventhub created. |


## Expected
```
az_eventhub_id_output = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.EventHub/namespaces/xxx/eventhubs/ehub-xxx-app-009"
az_eventhub_name_output = "ehub-xxx-app-009"
az_eventhub_namespace_output = <sensitive>
```
```
<!-- END_TF_DOCS -->
