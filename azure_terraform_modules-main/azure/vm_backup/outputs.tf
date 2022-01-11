#----------------------------------------------------
# Output of Azure Recovery Service Vault
#----------------------------------------------------

output "az_recovery_service_vault" {
  value = azurerm_recovery_services_vault.az_recovery_service_vault
}

#-----------------------------------------------------
# Output of Azure Recovery Service Vault Policy
#-----------------------------------------------------

output "az_recovery_service_vault_policy" {
  value = azurerm_backup_policy_vm.az_backup_policy_vm
}

