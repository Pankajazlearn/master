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
      cidr_blocks = ["10.140.10.0/32"]
      description = "xxx-01"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },
  ]
}

variable "aws_security_group_egress" {
  description = "Provide the security group egress range under which the resources are provisioned"
  default = [
    {
      self        = false
      cidr_blocks = ["172.31.10.0/32"]
      description = "On-prem-xxxx-controller-001"
      from_port   = 80
      to_port     = 80
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

