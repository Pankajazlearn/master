variable "environment" {
  description = "The environment used for all the resources in this provision.\nExpected values are: dev,prod,sandbox,UAT,test"
  type        = string
}

variable "project" {
  description = "The project in which the resources are provisioned"
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

variable "location" {
  description = "The Azure location where all resources in this provision should be created"
  type        = string
}

variable "location_abbreviation" {
  description = "The abbreviation of Azure location where all resources in this provision should be created"
  type        = string
}

variable "operational_company" {
  description = "The Operational Company for which the resorces are provisioned"
  type        = string
}

variable "az_resource_group_name" {
  description = "A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created."
  type        = string
}

variable "az_vnet_name" {
  description = "The name of the virtual network to which to attach the subnet"
  type        = string
}

variable "az_subnet_cidr" {
  description = <<EOF
  The CIDR range of the Subnet/s that should be created in the new Vnet.
  Enter comma separated values of Subnet/s CIDR if more than one Subnet is needed.
  example: 10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24
  EOF
  type = string
}

variable "az_nsg_id" {
  type        = string
  description = "The NSG's id to which the Subnet/s have to be associated."
}

variable "az_route_table_id" {
  type        = string
  description = "The Route Table's id to which the Subnet/s have to be associated."
}

variable "az_subnet_sequence" {
  type = string
  description = "The suffix sequence for the Subnet/s to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented."
}
