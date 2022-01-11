<!-- BEGIN_TF_DOCS -->
# Azure Infrastructure as Code

Terraform Modules to create Azure virtual network, subnet, network security group, route table, network watcher flow log and virtual machine with backup enabled. 

## Requirements

| Name | Version |
|------|---------|
| terraform | = 1.0.9 |
| azurerm | = 2.71.0 |


## Modules

Below is the complete list of modules. Any module can be used separately with the required requirements.
| Name | Source | Version |
|------|--------|---------|
| az\_compute | ./compute/ | 1.0 |
| az\_network\_flow\_log | ./network_flow_log/ | 1.0 |
| az\_nsg | ./nsg/ | 1.0 |
| az\_route\_table | ./route_table/ | 1.0 |
| az\_subnet | ./subnet/ | 1.0 |
| az\_virtual\_network | ./vnet/ | 1.0 |
| az\_vm\_backup | ./vm_backup/ | 1.0 |

## Azure Virtual Network Module
- Pre-requisites for using Virtual Network module
    - A pre-existing Resource Group, if not creating a new one.
    - A valid CIDR range must be provided to create a virtual network. 
- The Virtual network module creates virtual network/s in an existing or a new resource group.
- `create_resource_group` is set to false by default.

## Azure Network Security Group Module
- Pre-requisites for using Network Security Group module
    - A pre-existing Resource Group
- The Network Security Group module creates a NSG with dynamic Inbound rules.
- The Network Security Group module creates a NSG with dynamic Outbound rules. 

## Azure Route Table Module
- Pre-requisites for using Route Table module
    - A pre-existing Resource Group
- The Route Table creates a Route Table with dynamic routes.
- Routes are to be defined as a `list(map(string))` to the `route_table_routes`.

## Azure Subnet Module
- Pre-requisites for using Subnet module
    - A pre-existing Virtual Network name and id.
    - A valid CIDR (must be a part of the vnet CIDR range) range must be provided to create a one ore more Subnets.
    - A pre-existing Network Security Group's id.
    - A pre-existing Route Table's id.

- The Subnet module creates Subnet/s in a virtual network.
- The Subnet module creates an association between the Subnet/s and NSG.  
- The Subnet module creates an association between the Subnet/s and Route Table.

## Azure Network Watcher Log
- Pre-requisites for using Subnet module
    - A Storage account id to attach the network flow log.

- The Network Wacther Flow Log will be created in the provided location's Network Watcher.

## Azure Linux virtual Machine Module

- Pre-requisites for using compute and vm_backup module

    - Resource group must pre-exist
    - Storage account must pre-exist in same resource group and region
    - Image must pre-exist in same resource group and region
    - Keyvault and secret must pre-exist with terraform having read access for secret must in same resource group and region
    

- The compute terraform module is designed to deploy azure Linux virtual machines, with Image must be pre-existed in the account. Virtual machine is created with boot diagnostics and vm availability sets as an additional features, which are variablized. Os-disk and data-disk on instance termination flag is added and variablized. 

- `create_availability_set` is set to false by default.

- The password for the virtual machine is stored in azure key vault as secret, which must pre-existed with Terraform having read access for secret.

- OS-disk and data-disk are Server-side encrypted(SSE) with Platform managed keys(PMK). Count agrument is defined for managed disk to create 'n' number of managed disks and attach it to virtual machine as per requirement.

## Azure Linux virtual Machine Backup Module

- vm_backup module contains Recovery service vault with its backup policy with all the parameters variablized.

## Azure EventHub namespace and Event Hub

-  Pre-requisites for using Event Hub module
     - A Resource group must pre-exist
     - Event Hub namespace should be supplied in case it exists

- The event hub module manages a Event Hub as a nested resource within a Event Hubs namespace

## Metadata tags

The following list provides the recommended common tags that capture important context and information about resources. Use this list as a starting point to establish your tagging conventions.

Tag Name|Description|Key|Example Value|Required?
--------|-----------|---|-------------|---------|
Project Name | Name of the Project for the infra is created. This is mandatory to create a resource names. | Project |{Project name} |Yes
Business Unit | Top-level division of the company that owns the subscription or workload the resource belongs to. In smaller organizations, this may represent a single corporate or shared top-level organizational element. | BusinessUnit | BU |Yes
Environment|Deployment environment of this application, workload, or service.| Environment | prod, test, dev, staging, uat, sandbox |Yes
Owner Name|Owner of the application, workload, or service.| Owner | {email} |Yes
Operational Company | Operational company for which the resources are provisioned.| OpCo | OpCo | Yes


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| az\_dns\_servers | List of IP addresses of DNS servers | `list(string)` | n/a | yes |
| az\_resource\_group\_name | A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created. | `string` | n/a | yes |
| az\_route\_table\_name | The name of the route table to be created | `string` | n/a | yes |
| az\_route\_table\_routes | Routes of route table | `list(map(string))` | n/a | yes |
| az\_storage\_account\_id | The Storage Account id where the Network Watcher Flow Log should be provisioned. | `any` | n/a | yes |
| az\_subnet\_cidr | The CIDR range of the Subnet/s that should be created in the new Vnet.<br>  Enter comma separated values of Subnet/s CIDR if more than one Subnet is needed.<br>  example: 10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24 | `string` | n/a | yes |
| az\_vnet\_cidr | The CIDR range of Virtual Network that should be created | `list(string)` | n/a | yes |
| location | The Azure location where all resources in this provision should be created | `string` | n/a | yes |
| location\_abbreviation | The abbreviation of Azure location where all resources in this provision should be created | `string` | n/a | yes |

## Expected

```
az_compute = <sensitive>
az_network_flow_log = <sensitive>
az_nsg = <sensitive>
az_route_table = <sensitive>
az_subnet = {
"az_subnet" = {
...
az_virtual_network = {
"az_resource_group_output" = []
"az_virtual_network_output" = {
"address_space" = tolist([
...
"flow_timeout_in_minutes" = 0
"guid" = "xxx"
"id" = "/subscriptions/xxx/virtualNetworks/vnet-dev-un-001"
"location" = "uaenorth"
"name" = "vnet-dev-un-001"
"resource_group_name" = "xxx-resource-group"
"subnet" = toset([])
"tags" = tomap({
"BusinessUnit" = "business"
"Description" = "A Virtual network is created in the xxx-resource-group."
"Environment" = "dev"
"Name" = "vnet-dev-un-001"
"OpCo" = "xxx"
"Owner" = "xxx"
"Project" = "project1"
})
"timeouts" = null /* object */
"vm_protection_enabled" = false
}
}
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

az_eventhub_id_output = "/subscriptions/xxx/resourceGroups/xxx/providers/Microsoft.EventHub/namespaces/xxx/eventhubs/ehub-xxx-wvd-001"
az_eventhub_name_output = "ehub-xxx-wvd-001"
az_eventhub_namespace_output = <sensitive>
```

<!-- END_TF_DOCS -->
