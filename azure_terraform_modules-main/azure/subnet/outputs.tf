#-----------------------
# New Subnet id/s output
#-----------------------

output "az_subnet_id_output" {
  description = "List of ID/s of new Subnet/s created."
  value = toset([
    for az_subnet in azurerm_subnet.az_subnet: az_subnet.id
  ])
}

#-------------------------
# New Subnet name/s output
#-------------------------

output "az_subnet_name_output" {
  description = "List Name/s of new Subnet/s created."
  value = toset([
    for az_subnet in azurerm_subnet.az_subnet: az_subnet.name
  ])
}
