#----------------------------
# New Route Table Name Output
#----------------------------

output "az_route_table_name_output" {
  description = "Name of new Route Table created"
  value     = azurerm_route_table.az_route_table.name
}

#--------------------------
# New Route Table ID Output
#--------------------------

output "az_route_table_id_output" {
  description = "ID of new Route Table created"
  value     = azurerm_route_table.az_route_table.id
}
