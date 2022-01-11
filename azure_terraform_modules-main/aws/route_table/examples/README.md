<!-- BEGIN_TF_DOCS -->

## AWS Route Table

Configuration in this directory creates an AWS Route table with route of transit gateway to target 0.0.0.0/0

## Module Usage 

Following example to create an AWS Route table with route of transit gateway to target 0.0.0.0/0

### `main.tf`
```hcl
module "route_table" {
  source = "./route_table/"

  aws_region                 = var.aws_region
  environment                = var.environment
  project                    = var.project
  business_unit              = var.business_unit
  owner                      = var.owner
  operational_company        = var.operational_company
  aws_transit_gateway_id     = var.aws_transit_gateway_id
  aws_subnet_ids             = module.aws_subnet.aws_subnet_id_output
  aws_vpc_id                 = module.aws_vpc.aws_vpc_id_output
  aws_cidr_block_route_table = var.aws_cidr_block_route_table

  depends_on = [
    module.aws_vpc,
    module.aws_subnet
  ]
}

```

### `variables.tf`

```

variable "aws_region" {
  description = "Provide the name of the region in which the resources need to be provisioned"
  type        = string
  default     = "euw1"
}

variable "project" {
  description = "Provide the project name code of the Business Unit under which the resources are provisioned"
  type        = string
  default     = "project"
}

variable "environment" {
  description = "Provide the environment name under the resources are provisioned"
  type        = string
  default     = "dev"
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
  type        = string
  default     = "AA"
}

variable "owner" {
  description = "The owner of the resources are provisioned"
  type        = string
  default     = "demo@maf.ae"
}

variable "operational_company" {
  description = "Provide the Operational Company name under which the resources are provisioned"
  type        = string
  default     = "mafp"
}

variable "aws_cidr_vpc" {
  description = "Provide the cidr range under which the resources are provisioned"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_route_table_name" {
  description = "Provide the route table name under which the resources are provisioned"
  type        = string
  default     = "route_table"
}

variable "aws_route_table_routes" {
  description = "Provide the route table name under which the resources are provisioned"
  type        = string
  default     = "route_table"
}

variable "aws_subnet_ids" {
  description = "Provide the Subnet IDs under which the resources are provisioned"
  type        = list
  default     = []
}

variable "aws_transit_gateway_id" {
  description = "Provide the Transit Gateway ID under which the resources are provisioned"
  type        = string
  default     = "tgw-00c2eexxxxxxxx"
}


variable "aws_vpc_id" {
  description = "Provide the VPC ID under which the resources are provisioned"
  type        = string
  default     = ""
}

variable "aws_cidr_block_route_table" {
  description = "Provide the Cidr block for transit gateway under which the resources are provisioned"
  type        = string
  default     = "0.0.0.0/0"
}

variable "number_of_subnets" {
  description = "Number of subnet to be associated with route table"
  type        = number
  default     = 3
}

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.

## Outputs
```
#-----------------------------------------------
# Output of Route Table
#-----------------------------------------------

output "aws_route_table_id" {
  value = aws_route_table.aws_route_table.id
  description = "Output of Route Table ID"
}
```
<!-- END_TF_DOCS -->
