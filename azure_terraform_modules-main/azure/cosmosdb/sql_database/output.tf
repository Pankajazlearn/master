output "db_id" {
  value       = azurerm_cosmosdb_sql_database.database.id
  description = "database id"

}

output "container_id" {
  value       = azurerm_cosmosdb_sql_container.container.id
  description = "container id"

}

