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
  default     = "arn:aws:s3:::xxxxxxxxxxxx"
}

