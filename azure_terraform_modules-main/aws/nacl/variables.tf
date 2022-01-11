variable "aws_region" {
  description = "Provide the name of the region in which the resources need to be provisioned"
  type        = string
}

variable "project" {
  description = "Provide the project or application name under which the resources are provisioned"
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

variable "egress_action" {
  description = "Provide the action for egress traffic"
  type        = string
}

variable "egress_cidr_block" {
  description = "Provide the cidr block for egress traffic"
  type        = string
}

variable "egress_source_port" {
  description = "Provide the egress source port"
  type        = number
}

variable "egress_destination_port" {
  description = "Provide the egress destination port"
  type        = number
}

variable "ingress_action" {
  description = "Provide the action for ingress traffic"
  type        = string
}

variable "ingress_cidr_block" {
  description = "Provide the cidr block for ingress traffic"
  type        = string
}

variable "ingress_source_port" {
  description = "Provide the ingress source port"
  type        = number
}

variable "ingress_destination_port" {
  description = "Provide the ingress destination port"
  type        = number
}

variable "aws_vpc_id" {
  description = "Provide the VPC ID"
  type        = string
  default     = ""
}

variable "aws_subnet_ids" {
  description = "Provide the Subnet IDs"
  type        = list
  default     = []
}

variable "sequence_of_nacl" {
  description = "Resource counter"
  type        = number
  default     = 1
}
