#--------------------------------
# Vnet Resource Group Name Output
#--------------------------------

output "az_vnet_resource_group_name_output" {
  description   = "Name of Virtual Network's Resource Group"
  value         = azurerm_virtual_network.az_virtual_network.resource_group_name
}

#------------------------------
# New Virtual Network Name Output
#------------------------------

output "az_virtual_network_name_output" {
  description   = "ID of new Virtual Network created"
  value         = azurerm_virtual_network.az_virtual_network.name
}

#--------------------------------
# New Virtual Network ID Output
#--------------------------------

output "az_virtual_network_id_output" {
  description   = "Name of new Virtual Network created"
  value         = azurerm_virtual_network.az_virtual_network.id
}
