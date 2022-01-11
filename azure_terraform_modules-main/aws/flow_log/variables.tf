variable "aws_region" {
  description = "Provide the abbreviation name of the region in which the resources need to be provisioned"
  type        = string
}

variable "project" {
  description = "Provide the project name code of the Business Unit under which the resources are provisioned"
  type        = string
}

variable "environment" {
  description = "Provide the environment name under the resources are provisioned"
  type        = string
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
  type        = string
}

variable "owner" {
  description = "The owner of the resources are provisioned"
  type        = string
}

variable "operational_company" {
  description = "Provide the Operational Company name under which the resources are provisioned"
  type 	      = string
}

variable "aws_vpc_id" {
  description = "Provide the VPC ID under which the resources are provisioned"
  type        = string
  default     = ""
}

variable "count_of_s3_bucket" {
  description = "Resource counter"
  type        = number
  default     = 1
}

variable "aws_s3_bucket_arn" {
  description = "Provide the arn of the pre-existing S3 Bucket"
  type        = string
}
