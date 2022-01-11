variable "environment" {
  description = "The environment used for all the resources in this provision.\nExpected values are: dev,prod,sandbox,UAT,test"
  type        = string
}

variable "location" {
  description = "The Azure location where all resources in this provision should be created"
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

variable "az_resource_group_name" {
  description = "A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created."
  type = string
}

variable "default_network_security_group_inbound" {
  default = [
    {
      "name"                      : "Inbound-001",
      "priority"                  : "200",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : [],
      "source_address_prefix"     : "192.0.0.0/32" ,
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "Inbound-002",
      "priority"                  : "201",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["123"],
      "source_address_prefix"     : "192.0.0.1/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "Inbound-003",
      "priority"                  : "202",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["123", "456"],
      "source_address_prefix"     : "192.0.0.2/32",
      "destination_address_prefix": "*"
    }
  ]
}

variable "default_network_security_group_outbound" {
  default = [
    {
      "name"                      : "Outbound-001",
      "priority"                  : "300",
      "direction"                 : "Outbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["80", "81", "82", "83"],
      "source_address_prefix"     : "*",
      "destination_address_prefix": "172.0.0.0/32"
    },

    {
      "name"                      : "Outbound-002",
      "priority"                  : "301",
      "direction"                 : "Outbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["80", "81"],
      "source_address_prefix"     : "*",
      "destination_address_prefix": "172.0.0.1/32"
    }
  ]
}

variable "az_nsg_sequence" {
  type = string
  description = "The suffix sequence for the NSG to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented."
}
