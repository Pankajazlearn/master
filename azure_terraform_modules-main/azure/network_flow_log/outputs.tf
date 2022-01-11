#------------------------------------
# New Network Watcher Flow Log Name Output
#------------------------------------

output "az_network_watcher_flow_log_name_output" {
  description = "Name of new Network Watcher Flow Log created."
  value = azurerm_network_watcher_flow_log.az_network_watcher_flow_log.name
}


#---------------------------------------
# New Network Watcher Flow Log ID Output
#---------------------------------------

output "az_network_watcher_flow_log_id_output" {
  description = "ID of new Network Watcher Flow Log created."
  value = azurerm_network_watcher_flow_log.az_network_watcher_flow_log.id
}
