<!-- BEGIN_TF_DOCS -->

# AWS Security Group

Configuration in this directory creates an AWS Security Group

## Module Usage

Following example to create a Security Group

### `main.tf`

```hcl

module "security_group" {
  source = "./security_group/"

  aws_region                 = var.aws_region
  environment                = var.environment
  project                    = var.project
  business_unit              = var.business_unit
  owner                      = var.owner
  operational_company        = var.operational_company
  aws_vpc_id                 = module.aws_vpc.aws_vpc_id_output
  aws_security_group_ingress = var.aws_security_group_ingress
  aws_security_group_egress  = var.aws_security_group_egress

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

variable "aws_security_group_ingress" {
  description = "Provide the security group ingress range under which the resources are provisioned"
  default = [
    {
      self        = false
      cidr_blocks = ["10.140.x.xxx/32"]
      description = "xxx-01"
      from_port   = x
      to_port     = x
      protocol    = "tcp"
    },
  ]
}

variable "aws_security_group_egress" {
  description = "Provide the security group egress range under which the resources are provisioned"
  default = [
    {
      self        = false
      cidr_blocks = ["172.31.xxx.xx/32"]
      description = "On-prem-xxxx-controller-001"
      from_port   = xx
      to_port     = xx
      protocol    = "tcp"
    },
  ]
}


variable "aws_vpc_id" {
  description = "Provide the VPC ID under which the resources are provisioned"
  type        = string
  default     = ""
}

variable "sequence_of_security_group" {
  description = "Resource counter"
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

Run `terraform destroy` when you don't need these resources.

## Outputs
```
#-------------------------------------------
# Output of Security Group
#-------------------------------------------

output "aws_security_group_output" {
  value     = aws_security_group.aws_security_group.id
  description = "The Output of Security Group"
}
```
<!-- END_TF_DOCS -->
