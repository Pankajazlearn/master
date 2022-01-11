<!-- BEGIN_TF_DOCS -->
# Route Table resource creation example

Configuration in this directory creates an Azure Route Table resource. The routes for the route table can be added/excluded as per your requirement.

## Module Usage

Following example to create a route table with dynamic routes.

| Note: If used with Subnet module, the Route Table module should always run first. Hence, add the Azure Route Table module in depends on of Subnet module. 

### Main File (main.tf)
```hcl
module "az_route_table" {
    # Can point to a repository link as well 
    source   = "../"

    # Version of the module can be added with future roll-outs.
    #version = "" 

    # Below are the metadata tags for Azure Route Table
    environment            = var.environment
    owner                  = var.owner
    business_unit          = var.business_unit
    project                = var.project
    operational_company    = var.operational_company

    # Below are the required inputs to provision a Route Table from the module
    location               = var.location
    az_route_table_name    = var.az_route_table_name
    az_resource_group_name = var.az_resource_group_name
    az_route_table_routes  = var.az_route_table_routes
}
```

### Variables Assignment File (variables.auto.tfvars)
```hcl
environment            = "dev"
project                = "example"
owner                  = "example@mail.ae"
business_unit          = "BU"
operational_company    = "OpCo"
location               = "uaenorth"
az_resource_group_name = "test-examples"
az_route_table_name    = "example-route-table"
az_route_table_routes  = [
    {
        name = "route-001",
        address_prefix = "192.0.0.0/32",
        next_hop_type = "VirtualNetworkGateway"
    },
    {
        name = "route-002",
        address_prefix = "192.0.1.0/32",
        next_hop_type = "VnetLocal"
    },

    # The default next_hop_type is "VirtualAppliance", which needs an extra argument "next_hop_in_ip_address"
    {
        name = "route-003",
        address_prefix = "192.0.2.0/32",
        next_hop_in_ip_address = "192.0.0.2"
    },
    # The "next_hop_in_ip_address" value has to be supplied even when the "next_hop_type" is explicitly assigned as "VirtualAppliance"
    {
        name = "route-003",
        address_prefix = "192.0.2.0/32",
        next_hop_typw  = "VirtualAppliance"
        next_hop_in_ip_address = "192.0.0.2"
    }
]
```

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.


## Output

| Name | Description |
|------|-------------|
| <a name="output_az_route_table_output"></a> [az\_route\_table\_output](#output\_az\_route\_table\_output) | Output of Route Table module which contains Name and ID of the newly created Route Table |

## Expected Output
```
az_route_table_id_output = "/subscriptions/xxx/resourceGroups/test-examples/providers/Microsoft.Network/routeTables/rtable"

az_route_table_name_output = "route-example-route-table"
```
<!-- END_TF_DOCS -->
