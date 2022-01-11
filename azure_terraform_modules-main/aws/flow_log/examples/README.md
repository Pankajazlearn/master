<!-- BEGIN_TF_DOCS -->

# AWS Flowlogs

Configuration in this directory creates a AWS Flowlogs and stores it in a S3 Bucket

# Module Usage

Following example to create a AWS Flowlogs and stores it in a S3 Bucket

### `main.tf`
```hcl

module "flow_log" {
  source = "./flow_log/"

  aws_region          = var.aws_region
  environment         = var.environment
  project             = var.project
  business_unit       = var.business_unit
  owner               = var.owner
  operational_company = var.operational_company
  aws_vpc_id          = module.aws_vpc.aws_vpc_id_output

  depends_on = [
    module.aws_vpc,
    module.aws_subnet
  ]
}

```
## `variables.tf`

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

variable "aws_vpc_id" {
  description = "Provide the VPC ID under which the resources are provisioned"
  type        = string
  default     = ""
}

variable "count_of_s3_bucket" {
  description = "Provide the count of S3 Bucket under which the resources are provisioned"
  type        = number
  default     = 1
}

variable "aws_s3_bucket_arn" {
  description = "Provide the arn of the S3 Bucket available"
  type        = string
  default     = "arn:aws:s3:::xxxxxxxxxxxxx"
}

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

```
#---------------------------
# AWS Flow Logs output
#---------------------------
output "aws_flow_logs_output" {
  value = aws_flow_log.aws_flow_log.id
  description = "The output of AWS Flow Logs"
}
```
<!-- END_TF_DOCS -->
