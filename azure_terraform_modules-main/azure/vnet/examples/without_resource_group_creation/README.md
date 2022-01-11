<!-- BEGIN_TF_DOCS -->
# Virtual Network 

Configuration in this directory creates an Azure Virtual Network resource. The creation of a Resource Group is `false` by default.

## Module Usage

Following example to create a Virtual Network.

### Prerequisite
- Existing Resource Group.

### `main.tf`
```hcl
module "az_vnet" {
    source = "../"

    environment         = var.environment
    owner               = var.owner
    business_unit       = var.business_unit
    project             = var.project
    operational_company = var.operational_company

    location               = var.location
    location_abbreviation  = var.location_abbreviation

    # Resource group where the Vnet will be provisioned.
    az_resource_group_name = var.az_resource_group_name

    az_vnet_sequence       = var.az_vnet_sequence
    az_vnet_cidr           = var.az_vnet_cidr
    az_dns_servers         = var.az_dns_servers
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

# Resource group where the Vnet will be provisioned.
az_resource_group_name = "test-examples"

# The Virtual Network CIDR can be more than one with comma separated values.
az_vnet_cidr           = ["10.0.0.0/16"] 
az_dns_servers         = ["10.0.0.1", "10.0.0.2"]
az_vnet_sequence       = "009"
location_abbreviation  = "un"
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
| <a name="output_az_virtual_network_output"></a> [az\_virtual\_network\_output](#output\az\_virtual\_network\_output) | "Name and ID of Virtual Network and also the Resource Group where Vnet is created." |

## Expected
```
az_virtual_network_id_output       = "/subscriptions/xxx/virtualNetworks/vnet-dev-xxx-009"
az_virtual_network_name_output     = "vnet-dev-un-009"
az_vnet_resource_group_name_output = "test-examples"

```
<!-- END_TF_DOCS -->
