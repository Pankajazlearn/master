variable "az_resource_group_name" {
  description = "A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created."
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

variable "create_eventhub_namespace" {
  description = "Whether to create Eventhub Namespace and use it for Eventhub resource."
  type        = bool
  default     = false
}

variable "az_eventhub_namespace_name" {
  description = "An existing Eventhub namespace where the Eventhub should be provisioned. To be left blank if a new Resource Group has to be created."
  type        = string
  default     = "evhns-OpCo-un-009"
}

variable "project" {
  description = "The project in which the resources are provisioned"
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

variable "operational_company" {
  description = "The Operational Company for which the resorces are provisioned"
  type        = string
}

variable "application_name" {
  description = "The application for which the Eventhub is provisioned"
  type        = string
}

variable "az_eventhub_namespace_sequence" {
  type        = string
  description = "The sequence to be added in the Eventhub Namespace's name to be created."
  default     = ""
}

variable "az_eventhub_sequence" {
  type        = string
  description = "The sequence to be added in the Eventhub's name to be created."
}

variable "az_eventhub_namespace_sku" {
  type        = string
  description = "Defines which tier to use. Valid options are Basic, Standard, and Premium"
  default     = ""
}

variable "az_eventhub_namespace_capacity" {
  type        = string
  description = "Specifies the Capacity / Throughput Units for a Standard SKU namespace."
  default     = ""
}

variable "az_eventhub_partition_count" {
  type        = string
  description = "Specifies the current number of shards on the Event Hub. Changing this forces a new resource to be created."
}

variable "az_eventhub_message_retention" {
  type        = string
  description = "Specifies the number of days to retain the events for this Event Hub."
}
