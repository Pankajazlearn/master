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
  default     = "tgw-00c2eea4xxxxxxxxxx"
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

