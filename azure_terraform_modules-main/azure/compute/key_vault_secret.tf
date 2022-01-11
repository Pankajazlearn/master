#-------------------------------------------------------------
# Data source for Azure key vault 
#-------------------------------------------------------------

data "azurerm_key_vault" "az_key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

#-------------------------------------------------------------
# Data source for Azure key vault secret
#-------------------------------------------------------------

data "azurerm_key_vault_secret" "az_vm_password" {
  name         = var.key_vault_secret
  key_vault_id = data.azurerm_key_vault.az_key_vault.id
}

