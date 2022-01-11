variable "cosmosdb_sql_dbname" {
  description = "SQL database name"
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group where to create the resource."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created."
  type        = string
}
variable "cosmosdb_account_name" {}
variable "sql_db_container_name" {}
variable "sql_db_throughput" {
  description = "db throughput"
  type        = number
  default     = null
}
variable "db_autoscale_settings" {
  description = "autoscale settings"
  default     = null
}

variable "container_unique_key" {
  description = "container unique key"
  default     = null
}

variable "container_autoscale_settings" {
  description = "container autoscale settings"
  default     = null

}

variable "container_indexing_policy" {
  description = "container indexing policy"
  default     = null
}

variable "partition_key_path" {
  description = "partition key path"

}
variable "sql_container_throughput" {
  description = "throughput"
  default     = null
}
variable "sql_db_default_ttl" {
  description = "throughput"
  default     = null
}
