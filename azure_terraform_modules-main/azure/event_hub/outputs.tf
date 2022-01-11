#------------------------------
# New Eventhub Namespace Output
#------------------------------

output "az_eventhub_namespace_output" {
  value       = azurerm_eventhub_namespace.az_eventhub_namespace
  sensitive   = true
}

#---------------------------
# New Eventhub Name 
#---------------------------

output "az_eventhub_name_output" {
  value       = azurerm_eventhub.az_eventhub.name
}

#---------------------------
# New Eventhub ID 
#---------------------------

output "az_eventhub_id_output" {
  value       = azurerm_eventhub.az_eventhub.id
}
