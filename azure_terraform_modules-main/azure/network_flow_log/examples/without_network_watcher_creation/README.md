<!-- BEGIN_TF_DOCS -->
# Network Watcher Flow Log resource creation example

Configuration in this directory creates an Azure Network Watcher Flow Log resource. The creation of Network Watcher is `false` by default.

## Module Usage

Following example to create a Network Watcher Flow Log.

### Prerequisites
- Existing Network Wacther.
- Existing storage account.
- If using a storage account across subscrption the following provider block has to be specified in `providers.tf ` or `versions.tf` with an alias name of subscription and a subscription ID. 

### `providers.tf` or `versions.tf`
```hcl
provider "azurerm" {
  features {}

  alias           = "management_subscription" # Just an alias name you will be providing to refernce this subscription.
  subscription_id = "xxxx-xxxx"               # Subsciption id where the storage account exists.
}
```
### `main.tf`
```hcl

# Existing Storage Account Data from Management Subscription 

data "azurerm_storage_account" "az_storage_account_data" {
  provider            = azurerm.management_subscription
  name                = var.az_storage_account_name
  resource_group_name = var.az_storage_account_resource_group_name
}

module "az_network_flow_log" {
    source = "../../"

    environment         = var.environment
    owner               = var.owner
    business_unit       = var.business_unit
    project             = var.project
    operational_company = var.operational_company

    location                               = var.location
    location_abbreviation                  = var.location_abbreviation

    # If used with an NSG module, the below value can be taken from the NSG module's output.
    az_nsg_id                              = var.az_nsg_id     

    az_storage_account_name                = var.az_storage_account_name
    az_storage_account_resource_group_name = var.az_storage_account_resource_group_name
    az_network_watcher_flow_log_sequence   = var.az_network_watcher_flow_log_sequence
    az_storage_account_data_id             = data.azurerm_storage_account.az_storage_account_data.id
}
```
### `variables.auto.tfvars`
```hcl
environment            = "dev"
project                = "example"
owner                  = "example@mail.ae"
business_unit          = "BU"
operational_company    = "OpCo"
location               = "southindia"

# If used with an NSG module, the below value can be taken from the NSG module's output and it doesn't have to be defined in variables file. 
az_nsg_id              = "/subscriptions/xxx/resourcegroups/test-examples/providers/Microsoft.Network/networkSecurityGroups/nsg"

location_abbreviation  = "un"
az_storage_account_name  = "testnetworkstorage747"
az_storage_account_resource_group_name = "test-examples"
az_network_watcher_flow_log_sequence = "009"
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
| <a name="output_az_network_flow_log_output"></a> [az\_network\_flow\_log\_output](#output\_az\_network\_flow\_log\_output) | Name and ID output of Network Watcher flow log |

## Expected Output

```hcl
az_network_watcher_flow_log_id_output = "/subscriptions/xxx/resourceGroups/NetworkWatcherRG/providers/Microsoft.Network/networkWatchers/NetworkWatcher_uaenorth/networkSecurityGroupId/subscriptions/xxx/resourceGroups/demo-iac-rg/providers/Microsoft.Network/networkSecurityGroups/nsg"

az_network_watcher_flow_log_name_output = "Microsoft.Networkdemo-iac-rgnsg"
```
<!-- END_TF_DOCS -->
