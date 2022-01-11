resource "azurerm_cosmosdb_mongo_database" "database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  throughput          = try(var.db_throughput, null)

  # Note : throughput & autoscaling are conflicting properties
  dynamic "autoscale_settings" {
    for_each = try(var.db_autoscale_settings, {})

    content {
      max_throughput = autoscale_settings.value.max_throughput
    }
  }
}

resource "azurerm_cosmosdb_mongo_collection" "collection" {
  name                = var.collection_name
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  database_name       = azurerm_cosmosdb_mongo_database.database.name
  shard_key           = var.shard_key
  default_ttl_seconds = try(var.default_ttl_seconds, -1)
  throughput          = try(var.collection_throughput, null)

  # Note : throughput & autoscaling are conflicting properties
  dynamic "autoscale_settings" {
    for_each = try(var.collection_autoscale_settings, {})

    content {
      max_throughput = autoscale_settings.value.max_throughput
    }
  }

  dynamic "index" {
    for_each = try(var.collection_index, {})

    content {
      keys   = index.value.keys
      unique = try(index.value.unique, false)
    }
  }
}
