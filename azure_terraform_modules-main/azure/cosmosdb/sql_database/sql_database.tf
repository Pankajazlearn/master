# Create database
resource "azurerm_cosmosdb_sql_database" "database" {
  name                = var.cosmosdb_sql_dbname
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  throughput          = var.sql_db_throughput

  # Note : throughput & autoscaling is conflicting properties, Therefore, set any one of them
  dynamic "autoscale_settings" {
    for_each = var.db_autoscale_settings != null ? var.db_autoscale_settings : {}
    content {
      max_throughput = try(autoscale_settings.value.max_throughput, {})
    }
  }
}

# Create container
resource "azurerm_cosmosdb_sql_container" "container" {


  name                = var.sql_db_container_name
  resource_group_name = var.resource_group_name
  account_name        = var.cosmosdb_account_name
  database_name       = azurerm_cosmosdb_sql_database.database.name
  partition_key_path  = var.partition_key_path
  throughput          = var.sql_container_throughput

  default_ttl = try(var.sql_db_default_ttl, -1)

  dynamic "unique_key" {
    for_each = var.container_unique_key != null ? var.container_unique_key : {}

    content {
      paths = try(unique_key.each.value.path, {})
    }
  }

  # Note : throughput & autoscaling is conflicting properties, Therefore, set any one of them
  dynamic "autoscale_settings" {
    for_each = var.container_autoscale_settings != null ? var.container_autoscale_settings : {}

    content {
      max_throughput = try(autoscale_settings.value.max_throughput, {})
    }
  }

  dynamic "indexing_policy" {
    for_each = var.container_indexing_policy != null ? var.container_indexing_policy : {}

    content {
      indexing_mode = try(indexing_policy.value.indexing_mode, {})
      included_path {
        path = try(indexing_policy.value.included_path, {})
      }
      excluded_path {
        path = try(indexing_policy.value.excluded_path, {})
      }
      composite_index {
        index {
          path  = try(indexing_policy.value.path, {})
          order = try(indexing_policy.value.order, {})
        }
      }
    }
  }

}

