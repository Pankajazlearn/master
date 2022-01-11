<!-- BEGIN_TF_DOCS -->

# AWS VPC

Configuration in this directory creates AWS Virtual Private Cloud

## Module Usage

Following example to create a VPC

### `main.tf`

```
module "aws_vpc" {
  source = "./vpc/"
  aws_region          = var.aws_region
  environment         = var.environment
  project             = var.project
  business_unit       = var.business_unit
  owner               = var.owner
  operational_company = var.operational_company
  aws_cidr_vpc        = var.aws_cidr_vpc
}

```

### `variables.tf`

```

variable "aws_region" {
  description = "Provide the abbreviation name of the region in which the resources need to be provisioned"
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
  default     = "10.100.216.0/24"
}

variable "count_of_vpc" {
  description = "Count of Virtual Private Cloud to be created"
  type        = number
  default     = 1
}


## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

## Outputs

```
#---------------------------
# New Virtual Private Cloud Output
#---------------------------

output "aws_vpc_id_output" {
  value = module.aws_vpc
  description = "The output of VPC ID"
}
```

<!-- END_TF_DOCS -->

