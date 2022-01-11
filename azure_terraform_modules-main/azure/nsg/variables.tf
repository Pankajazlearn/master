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
      "name"                      : "Qualys-001",
      "priority"                  : "200",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : [],
      "source_address_prefix"     : "10.140.6.197/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "Qradar-001",
      "priority"                  : "201",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["514"],
      "source_address_prefix"     : "10.140.1.104/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "Qradar-002",
      "priority"                  : "202",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["514"],
      "source_address_prefix"     : "10.140.1.196/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "BMC Monitoring",
      "priority"                  : "203",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : [],
      "source_address_prefix"     : "10.140.1.166/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "F5-001",
      "priority"                  : "204",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : [],
      "source_address_prefix"     : "10.140.1.106/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "F5-002",
      "priority"                  : "205",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["80", "443"],
      "source_address_prefix"     : "10.143.5.125/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "F5-003",
      "priority"                  : "206",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["80", "444"],
      "source_address_prefix"     : "10.143.5.74/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "F5-004",
      "priority"                  : "207",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["80", "445"],
      "source_address_prefix"     : "10.143.7.100/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "F5-005",
      "priority"                  : "208",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["80", "446"],
      "source_address_prefix"     : "10.143.7.132/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "F5-006",
      "priority"                  : "209",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["80", "447"],
      "source_address_prefix"     : "10.143.7.165/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "Heat Patch Server-001",
      "priority"                  : "210",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["137", "139", "443", "445", "80"],
      "source_address_prefix"     : "172.31.201.196/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "Kaspersky-001",
      "priority"                  : "211",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["14000"],
      "source_address_prefix"     : "10.110.110.112/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "Fireeye-001",
      "priority"                  : "212",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["80", "443"],
      "source_address_prefix"     : "52.29.174.42/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "jb.maf.ae(windows)-001",
      "priority"                  : "213",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["3389"],
      "source_address_prefix"     : "10.143.0.25/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "jb.maf.ae(windows)-002",
      "priority"                  : "214",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["3389"],
      "source_address_prefix"     : "10.143.16.25/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "jb.maf.ae(Linux)-001",
      "priority"                  : "215",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["22"],
      "source_address_prefix"     : "10.143.0.53/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "jb.maf.ae(Linux)-002",
      "priority"                  : "216",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["22"],
      "source_address_prefix"     : "10.143.16.44/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "on-prem-jump-server-001",
      "priority"                  : "217",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["3389"],
      "source_address_prefix"     : "10.110.110.130/32",
      "destination_address_prefix": "*"
    },

    {
      "name"                      : "on-prem-jump-server-002",
      "priority"                  : "218",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["3389"],
      "source_address_prefix"     : "10.110.110.120/32",
      "destination_address_prefix": "*"
    }
  ]
}

variable "default_network_security_group_outbound" {
  default = [
    {
      "name"                      : "On-prem-domain-controller-001",
      "priority"                  : "300",
      "direction"                 : "Outbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["53", "88", "389", "636"],
      "source_address_prefix"     : "*",
      "destination_address_prefix": "172.31.201.11/32"
    },

    {
      "name"                      : "On-prem-domain-controller-002",
      "priority"                  : "301",
      "direction"                 : "Outbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["53", "88", "389", "636"],
      "source_address_prefix"     : "*",
      "destination_address_prefix": "172.31.201.12/32"
    },

    {
      "name"                      : "AWS-Properties-domain-controller-001",
      "priority"                  : "302",
      "direction"                 : "Outbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["53", "88", "389", "636"],
      "source_address_prefix"     : "*",
      "destination_address_prefix": "10.140.6.17/32"
    },

    {
      "name"                      : "AWS-Infra-domain-controller-001",
      "priority"                  : "303",
      "direction"                 : "Outbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["53", "88", "389", "636"],
      "source_address_prefix"     : "*",
      "destination_address_prefix": "10.143.16.10/32"
    },

    {
      "name"                      : "AWS-Infra-domain-controller-002",
      "priority"                  : "304",
      "direction"                 : "Outbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : ["53", "88", "389", "636"],
      "source_address_prefix"     : "*",
      "destination_address_prefix": "10.143.0.10/32"
    }
  ]
}

variable "az_nsg_sequence" {
  type = string
  description = "The suffix sequence for the NSG to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented."
}
