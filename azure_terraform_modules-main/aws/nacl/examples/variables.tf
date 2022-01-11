variable "aws_region" {
  description = "Provide the name of the region in which the resources need to be provisioned"
  type        = string
  default     = "euw1"
}

variable "project" {
  description = "Provide the project or application name under which the resources are provisioned"
  type        = string
  default     = "app"
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

variable "egress_action" {
  description = "Provide the action for egress traffic"
  type        = string
  default     = "allow"
}

variable "egress_cidr_block" {
  description = "Provide the cidr block for egress traffic"
  type        = string
  default     = "10.0.0.0/16"
}

variable "egress_source_port" {
  description = "Provide the egress source port"
  type        = number
  default     = 443
}

variable "egress_destination_port" {
  description = "Provide the egress destination port"
  type        = number
  default     = 443
}

variable "ingress_action" {
  description = "Provide the action for ingress traffic"
  type        = string
  default     = "allow"
}

variable "ingress_cidr_block" {
  description = "Provide the cidr block for ingress traffic"
  type        = string
  default     = "10.0.0.0/16"
}

variable "ingress_source_port" {
  description = "Provide the ingress source port"
  type        = number
  default     = 80
}

variable "ingress_destination_port" {
  description = "Provide the ingress destination port"
  type        = number
  default     = 80
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
  description = "Resource Counter"
  type        = number
  default     = 1
}

