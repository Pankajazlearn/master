#--------------------
# New NSG Name Output
#--------------------

output "az_nsg_name_output" {
  description = "Name of new Network Security Group created."
  value     = azurerm_network_security_group.az_nsg.name
}

#------------------
# New NSG ID Output 
#------------------

output "az_nsg_id_output" {
  description = "ID of new Network Security Group created."
  value     = azurerm_network_security_group.az_nsg.id
}
