<!-- BEGIN_TF_DOCS -->

# AWS Subnet

This configuration in this directory creates AWS Subnet in the available Availability zones

## Module Usage

Following example to create AWS Subnet in the available Availability zones

### `main.tf`
```hcl

module "aws_subnet" {
  source = "./subnet/"

  aws_region          = var.aws_region
  environment         = var.environment
  project             = var.project
  business_unit       = var.business_unit
  owner               = var.owner
  operational_company = var.operational_company
  aws_cidr_vpc        = var.aws_cidr_vpc
  aws_cidr_subnet     = var.aws_cidr_subnet
  aws_vpc_id          = module.aws_vpc.aws_vpc_id_output

  depends_on = [
    module.aws_vpc,
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

variable "aws_cidr_subnet" {
  description = <<EOF
  The CIDR range of the Subnet/s that should be created in the new Vnet.
  Enter comma separated values of Subnet/s CIDR if more than one Subnet is needed.
  example: ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  EOF
  type        = list
  default     = ["10.100.216.1/26", "10.100.216.65/26", "10.100.216.66/26"]
}

variable "aws_cidr_vpc" {
  description = "Provide the cidr range under which the resources are provisioned"
  type        = string
}

variable "aws_vpc_id" {
  description = "Provide the VPC ID under which the resources are provisioned"
  type        = string
  default     = ""
}

variable "aws_subnet_id" {
  description = "Provide the Subnet IDs under which the resources are provisioned"
  type        = list
  default     = []
}

variable "count_of_availability_zones" {
  description = "Count of Availability zones needed to be created"
  type        = number
  default     = 3
}

variable "aws_route_table_id" {
  description = "Provide the Route table ID under which the resources are provisioned"
  type        = string
  default     = ""
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
#-----------------------
# New Subnet id/s output
#-----------------------

output "aws_subnet_id_output" {
  value = toset([
    for aws_subnet in aws_subnet.aws_subnet: aws_subnet.id
  ])
}
```

<!-- END_TF_DOCS -->
