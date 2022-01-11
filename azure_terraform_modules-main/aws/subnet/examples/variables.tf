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

