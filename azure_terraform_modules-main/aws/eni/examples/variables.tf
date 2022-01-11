variable "environment" {
  description = "The environment used for all the resources in this provision.\nExpected values are: dev,prod,sandbox,UAT,test"
  type        = string
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
  type        = string
}

variable "operational_company" {
  description = "The Operational Company for which the resorces are provisioned"
  type        = string
}

variable "owner" {
  description = "The owner of the resources are provisioned"
  type        = string
}

variable "project" {
  description = "The project in which the resources are provisioned"
  type        = string
}

variable "aws_network_interface_sequence" {
  description = "The sequence of the Network Interface for the EC2 instance"
  type        = string
}

variable "aws_network_interface_attachment_device_index" {
  description = "The network interface's position in the attachment order. The index should be 1 or more as the Primary Network Interface takes up index 0"
  type        = number
}

variable "aws_ec2_instance_id" {
  description = "Instance ID to attach"
  type        = string
}

variable "aws_ec2_instance_name" {
  description = "Instance Name to attach"
}

variable "aws_subnet_id" {
  type        = string
  description = "The Subnet id to which the AWS instance should be attached to"
}
