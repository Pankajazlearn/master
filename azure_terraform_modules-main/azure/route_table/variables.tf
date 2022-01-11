variable "environment" {
  description = "The environment used for all the resources in this provision.\nExpected values are: dev,prod,sandbox,UAT,test"
  type        = string
}

variable "location" {
  description = "The Azure location where all resources in this provision should be created"
  type        = string
}

variable "project" {
  description = "The project in which the resources are provisioned"
  type        = string
}

variable "owner" {
  description = "The owner of the resources are provisioned"
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

variable "az_resource_group_name" {
  description = "A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created."
  type = string
}

variable "az_route_table_name"{
  description  = "The name of the route table to be created"
  type         = string
}

variable "az_route_table_routes" {
  type        = list(map(string))
  description = "Routes of route table"
}
