# #############################################################################
# # OUTPUTS MY SQL Server
# #############################################################################

output "mysql_server_id" {
  value       = azurerm_mysql_server.mysql_server.id
  description = "The server id of MySQL Server"
}

output "mysql_server_name" {
  value       = azurerm_mysql_server.mysql_server.name
  description = "The server name of MySQL Server"
}

output "mysql_server_id_map" {
  value       = zipmap(tolist([azurerm_mysql_server.mysql_server.name]), tolist([azurerm_mysql_server.mysql_server.id]))
  description = "The server name to id map of MySQL Server"
}

output "mysql_databases_names" {
  value       = [for x in azurerm_mysql_database.mysql_db : x.name]
  description = "List of all MySQL database resource names"
}

output "mysql_database_ids" {
  value       = [for x in azurerm_mysql_database.mysql_db : x.id]
  description = "The list of all MySQL database resource ids"
}

output "mysql_firewall_rule_ids" {
  value       = [for x in azurerm_mysql_firewall_rule.firewall_rule : x.id]
  description = "List of MySQL Firewall Rule resource ids"
}

output "mysql_vnet_rule_ids" {
  value       = [for x in azurerm_mysql_virtual_network_rule.network_rule : x.id]
  description = "The list of all MySQL VNet Rule resource ids"
}

output "mysql_fqdn" {
  value       = azurerm_mysql_server.mysql_server.fqdn
  description = "The FQDN of MySQL Server"
}

output "admin_username" {
  value       = var.administrator_login_name
  description = "The administrator username of MySQL Server"
}
