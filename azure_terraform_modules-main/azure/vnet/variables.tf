variable "create_resource_group" {
  description   = "Whether to create resource group and use it for Virtual Network resource."
  type          = bool
  default       = false
}
variable "az_resource_group_name" {
  description   = "A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created."
  type          = string
  default       = ""
}

variable "location" {
  description   = "The Azure location where all resources in this provision should be created"
  type          = string
}

variable "location_abbreviation" {
  description   = "The abbreviation of Azure location where all resources in this provision should be created"
  type          = string
}

variable "project" {
  description   = "The project in which the resources are provisioned"
  type          = string
}

variable "environment" {
  description   = "The environment used for all the resources in this provision.\nExpected values are: dev,prod,sandbox,UAT,test"
  type          = string
}

variable "business_unit" {
  description   = "The business unit in which the resources are provisioned"
  type          = string
}

variable "owner" {
  description   = "The owner of the resources to be provisioned"
  type          = string
}

variable "operational_company" {
  description   = "The Operational Company for which the resorces are provisioned"
  type          = string
}

variable "az_dns_servers" {
  description   = "List of IP addresses of DNS servers"
  type          = list(string)
}

variable "az_vnet_cidr" {
  description   = "The CIDR range of Virtual Network that should be created"
  type          = list(string)
}

variable "az_vnet_sequence" {
  type = string
  description = "The suffix sequence for the Vnet to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented."
}

variable "az_resource_group_sequence" {
  type        = string
  description = "The suffix sequence for the Resource Group if ceated. The sequence number should always be checked from the Azure portal and incremented/decremented."
  default     = ""
}
