<!-- BEGIN_TF_DOCS -->
# Network Security Group resource creation example

Configuration in this directory creates an Azure NSG resource. The routes for the route table can be added/excluded as per your requirement.

## Module Usage

Following example to create a NSG with dynamic inbound and outbound routes.

| Note: If used with Subnet module, the NSG module should always run first. Hence, add the Azure NSG module in depends on of Subnet module. 

### Main File (main.tf)
```hcl
module "az_nsg" {
    source = "../"

    environment            = var.environment
    owner                  = var.owner
    business_unit          = var.business_unit
    project                = var.project
    operational_company    = var.operational_company

    location               = var.location
    az_resource_group_name = var.az_resource_group_name
    az_nsg_sequence        = var.az_nsg_sequence
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

# The suffix sequence for the NSG to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented

az_nsg_sequence        = "009"

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
| <a name="output_az_nsg_module_output"></a> [az\_nsg\_module\_output](#output\_az\_nsg\_module\_output) | Name and ID of new Network Security Group created. |

## Expected Output
```
az_nsg_id_output = "/subscriptions/xxx/resourceGroups/test-examples/providers/Microsoft.Network/networkSecurityGroups/nsg"

az_nsg_name_output = "nsg-dev-un-009"

```
<!-- END_TF_DOCS -->
