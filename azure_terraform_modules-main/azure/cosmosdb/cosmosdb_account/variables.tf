variable "resource_group_name" {
  description = "(Required) The name of the resource group where to create the resource."
  type        = string
}

variable "cosmosdb_account_name" {}
variable "kind" {
  description = "(Optional) Specifies the Kind of CosmosDB to create"
  type        = string

}
variable "enable_free_tier" {
  description = "Enable Free Tier pricing option for this Cosmos DB account"
  ### default is false. According to azure, only one free per subscription. so required variable better.

}

variable "access_key_metadata_writes_enabled" {
  description = "Enable write operations on metadata resources (databases, containers, throughput) via account keys"
  default     = true
}

variable "mongo_server_version" {
  description = "The Server Version of a MongoDB account."
  default     = null
}
variable "network_acl_bypass_for_azure_services" {
  description = "If azure services can bypass ACLs"
  default     = false

}
variable "network_acl_bypass_ids" {
  description = "The list of resource Ids for Network Acl Bypass for this Cosmos DB account."
  default     = null
}
variable "local_authentication_disabled" {
  description = "Disable local authentication and ensure only MSI and AAD can be used exclusively for authentication"
  default     = false
}
variable "cors_rule" {
  description = "define cors rule"
  default     = null

}
variable "location" {
  description = "Specifies the supported Azure location where the resource exists"
  type        = string
}
variable "tags" {
  description = "CosmosDB resource tags"
  default     = {}
}
variable "enable_automatic_failover" {
  description = "Enable automatic fail over for this Cosmos DB account."
  default     = false
}
variable "ip_range_filter" {
  description = "This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account."
  default     = null

}
variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this CosmosDB account."
  default     = false
}
variable "enable_multiple_write_locations" {
  description = "Enable multiple write locations for this Cosmos DB account."
  ### default is false. According to azure, only one free per subscription. so required variable better.
  default = false
}
variable "is_virtual_network_filter_enabled" {
  description = "Enables virtual network filtering for this Cosmos DB account"

  default = false
}
variable "consistency_policies" {
  description = "Configures the database consistency"
  default     = null
}
variable "geo_locations" {
  description = "Configures the geographic locations the data is replicated to"
  default     = null
}
variable "default_identity_type" {
  description = "The default identity for accessing Key Vault."
  default     = "FirstPartyIdentity"

}
variable "capabilities" {
  description = "Configures the capabilities to enable for this Cosmos DB account"
  default     = {}

}
variable "analytical_storage" {
  description = "analytica storage definition"
  default     = null

}
variable "analytical_storage_enabled" {
  description = "Enable Analytical Storage option for this Cosmos DB account."
  default     = false
}

variable "virtual_network_rule" {
  description = "virtual network rule"
  default     = null
}
variable "backup" {
  description = "Configures the database consistency"
  type = list(object({
    type                = string
    interval_in_minutes = number
    retention_in_hours  = number
    storage_redundancy  = string
  }))
  default = null
}

variable "tag_Environment" {
  type        = string
  description = "CosmosDB tag Environment"

}

variable "tag_Project" {
  type        = string
  description = "CosmosDB tag Project"

}

variable "tag_Owner" {
  type        = string
  description = "CosmosDB tag Owner"

}

variable "tag_BusinessUnit" {
  type        = string
  description = "CosmosDB tag BusinessUnit"

}

variable "tag_OpCo" {
  type        = string
  description = "CosmosDB tag OpCo"

}

variable "tag_Confidentiality" {
  type        = string
  description = "CosmosDB tag confidentiality"

}
variable "tag_Data_classification" {
  type        = string
  description = "CosmosDB tag Data classification"

}
