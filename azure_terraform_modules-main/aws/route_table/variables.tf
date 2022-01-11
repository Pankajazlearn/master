
variable "aws_region" {
  description = "Provide the name of the region in which the resources need to be provisioned"
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

variable "aws_cidr_vpc" {
  description = "Provide the cidr range under which the resources are provisioned"
  type        = string
}

variable "aws_route_table_name" {
  description = "Provide the route table name under which the resources are provisioned"
  type        = string
}

variable "aws_subnet_ids" {
  description = "Provide the Subnet IDs under which the resources are provisioned"
  type        = list
  default     = []
}

variable "aws_transit_gateway_id" {
  description = "Provide the Transit Gateway ID under which the resources are provisioned"
  type        = string
}


variable "aws_vpc_id" {
  description = "Provide the VPC ID under which the resources are provisioned"
  type        = string
  default     = ""
}

variable "aws_cidr_block_route_table" {
  description = "Provide the Cidr block for transit gateway under which the resources are provisioned"
  type        = string
}

variable "number_of_subnets" {
  description = "Number of subnet to be associated with route table"
  type        = number
  default     = 3
}
