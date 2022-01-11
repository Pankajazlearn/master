variable "environment" {
  description = "The environment used for all the resources in this provision."
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

variable "location" {
  description = "The Azure location where all resources in this provision should be created"
  type        = string
}

variable "create_network_watcher" {
  description = "Whether to create a network wacther and use it for Network Watcher Flow Logs."
  type        = bool
  default     = false
}

variable "project" {
  description = "The project in which the resources are provisioned"
  type        = string
}

variable "operational_company" {
  description = "The Operational Company for which the resorces are provisioned"
  type        = string
}

variable "az_nsg_id" {
  description = "The Network Security Group id where the Network Watcher Flow Log should be provisioned."
  type        = string
}

variable "az_storage_account_name" {
  description = "The Storage Account name where the Network Watcher Flow Log should be provisioned."
  type        = string 
}

variable "az_storage_account_resource_group_name" {
  description = "The Storage Account Resource Group name"
  type        = string 
}

variable "location_abbreviation" {
  description = "The abbreviation of Azure location where all resources in this provision should be created"
  type        = string
}

variable "az_network_watcher_flow_log_sequence" {
  type = number
  description = "The suffix sequence for the Network Watcher Flow Log to be provisioned. The sequence number should always be checked from the Azure portal and incremented."
} 
