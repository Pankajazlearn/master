#--------------------------------------------------------------
# Output of Azure Virtual Machine
#--------------------------------------------------------------

output "az_virtual_machine_id_output" {
  value  = azurerm_virtual_machine.az_virtual_machine.id
  description = "The output of Virtual Machine ID"
}

#--------------------------------------------------------------
# Output of Azure SQL Virtual Machine
#--------------------------------------------------------------

output "az_sql_virtual_machine_id_output" {
  value  = azurerm_mssql_virtual_machine.az_mssql_virtual_machine.id
  description = "The output of SQL Virtual Machine ID"
}

