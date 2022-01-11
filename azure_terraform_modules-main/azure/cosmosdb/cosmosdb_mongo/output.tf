output "collection_id" {
  description = "The CosmosDB collection Id."
  value       = azurerm_cosmosdb_mongo_collection.collection.id
}

output "database_id" {
  description = "The CosmosDB database Id."
  value       = azurerm_cosmosdb_mongo_database.database.id
}
