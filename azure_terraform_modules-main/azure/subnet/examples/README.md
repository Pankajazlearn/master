<!-- BEGIN_TF_DOCS -->
# Subnet resource creation example

Configuration in this directory creates an Azure Subnet in a Virtual Network.

## Module Usage

Following example to create a Azure Subnet.

### Prerequisites
- Existing Virtual Network.
- A Network Security Group ID to associate the Subnets with NSG.
- A Route Table ID to associate the Subnets with Route Table.

### `main.tf`
```hcl
module "az_subnet" {
    source = "../"

    environment         = var.environment
    owner               = var.owner
    business_unit       = var.business_unit
    project             = var.project
    operational_company = var.operational_company

    location               = var.location
    location_abbreviation  = var.location_abbreviation
    az_resource_group_name = var.az_resource_group_name
    az_subnet_sequence     = var.az_subnet_sequence
    az_subnet_cidr         = var.az_subnet_cidr
    az_vnet_name           = var.az_vnet_name


    # If used with an NSG module, the below value can be taken from the NSG module's output.
    az_nsg_id              = var.az_nsg_id

    # If used with a Route Table module, the below value can be taken from the Route Table module's output.
    az_route_table_id      = var.az_route_table_id
    
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
az_resource_group_name = "test-examples"
location_abbreviation  = "un"
az_subnet_cidr         = "10.0.1.0/24,10.0.2.0/24, 10.0.3.0/24"
az_vnet_name           = "vnet-dev-un-001"
az_subnet_sequence     = "001"

# The below values doesn't have to be specified if the subnet module is used with NSG and Route Table module as it can be referenced from NSG and Route table modules.
az_nsg_id             = "/subscriptions/xxxx-xxxx/resourceGroups/test-examples/providers/Microsoft.Network/networkSecurityGroups/nsg-example-009"
az_route_table_id     = "/subscriptions/xxxx-xxxx/resourceGroups/test-examples/providers/Microsoft.Network/routeTables/route-example-route-table"

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
| <a name="output_az_subnet_module_output"></a> [az\_subnet\_module\_output](#output\_[az\_subnet\_module\_output) | Name/s and ID/s of new Subnet/s created. |

## Expected Output

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
<!-- END_TF_DOCS -->
