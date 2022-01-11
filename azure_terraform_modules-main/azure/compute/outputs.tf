#-------------------------------------------------------------
# Output of Azure Managed Disk
#-------------------------------------------------------------

output "az_managed_disk" {
  value = azurerm_managed_disk.az_managed_disk
}

#-------------------------------------------------------------
# Output of Azure Managed disk attachment
#-------------------------------------------------------------

output "az_data_disk_attachment" {
  value = azurerm_virtual_machine_data_disk_attachment.az_data_disk_attachment
}

#-------------------------------------------------------------
# Output of Azure Virtual Machine
#-------------------------------------------------------------

output "az_virtual_machine" {
  value = azurerm_virtual_machine.az_virtual_machine
  sensitive = true
}

#-------------------------------------------------------------
# Output of Azure Availability set
#-------------------------------------------------------------

output "az_availability_set" {
  value = azurerm_availability_set.az_availability_set
}

#-------------------------------------------------------------
# Output of Azure key vault
#-------------------------------------------------------------

output "az_key_vault" {
  value = data.azurerm_key_vault.az_key_vault
  sensitive = true
}

#--------------------------------------------------------------
# Output of Azure key vault secret
#--------------------------------------------------------------

output "az_key_vault_secret" {
  value = data.azurerm_key_vault_secret.az_vm_password
}
