variable "collection_name" {
  description = "name of mongo collection"
  type        = string

}
variable "resource_group_name" {
  description = "resource group name"
  type        = string

}
variable "database_name" {
  description = "mongo database name"
  type        = string

}
variable "cosmosdb_account_name" {
  description = "The name of the Cosmos DB Account where the Mongo Database to create the table within."
  type        = string
}
variable "shard_key" {
  description = "The name of the key to partition on for sharding. "
  type        = string

}

variable "default_ttl_seconds" {
  description = "The default Time To Live in seconds."
  type        = string

}
variable "analytical_storage_ttl" {
  description = "The default time to live of Analytical Storage for this Mongo Collection"
  default     = null

}
variable "collection_throughput" {
  description = "The throughput of the MongoDB collection (RU/s)"
  type        = number
  default     = null
}
variable "collection_autoscale_settings" {
  description = "The collection autoscale settings"
  default     = {}
}

variable "collection_index" {
  description = "index of the collection"
  default     = {}

}
variable "tags" {
  description = "tags"
  default     = {}
}

variable "db_throughput" {
  description = "database throughput"
  type        = number
  default     = null

}

variable "db_autoscale_settings" {
  description = "The database autoscale settings"
  default     = {}
}
