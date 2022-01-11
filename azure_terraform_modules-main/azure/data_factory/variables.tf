variable "create_resource_group" {
  description = "Whether to create resource group and use it for Virtual Network resource."
  type        = bool
  default     = false
}

variable "az_resource_group_name" {
  description = "A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created."
  type        = string
  default     = ""
}

variable "location" {
  description = "Location of the data factory"
  type        = string
}

variable "public_network_enabled" {
  description = "Is the Data Factory visible to the public network?"
  type        = string
}

variable "managed_virtual_network_enabled" {
  description = "Is the Data Factory to be deployed in a managed virtual network"
  type        = string
}

variable "project" {
  description = "The project for which the resources are provisioned"
  type        = string 
}

variable "environment" {
  description = "The environment used for all the resources in this provision.\nExpected values are: dev,prod,sandbox,UAT,test"
  type        = string 
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
  type        = string
}

variable "owner" {
  description = "The owner of the resources to be provisioned"
  type        = string
}

variable "technical_contact" {
  description = "The contact of the resources to be provisioned"
  type        = string
}

variable "operational_company" {
  description = "The Operational Company for which the resorces are provisioned"
  type        = string
}
