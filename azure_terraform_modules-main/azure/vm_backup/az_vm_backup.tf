#---------------------------------------------------------------------------
# Create Azure recovery service vault to store the backup of virtual machine
#---------------------------------------------------------------------------

resource "azurerm_recovery_services_vault" "az_recovery_service_vault" {
  name                = "rsv-${var.project}-${var.environment}-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  soft_delete_enabled = var.soft_delete_enabled

  tags = merge(
    local.common_tags,
    {
      Name        = "rsv-${var.project}-${var.environment}-01",
      Description = "A Recovery service vault is created in the ${var.resource_group_name}."
    }
  )
}

#----------------------------------------------------------------------------
# Create Azure recovery service backup policy with required parameters and values for virtual machine backup
#----------------------------------------------------------------------------

resource "azurerm_backup_policy_vm" "az_backup_policy_vm" {
  name                = "rsvbp-${var.project}-${var.environment}-01"
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.az_recovery_service_vault.name

  timezone = var.timezone

  backup {
    frequency = var.frequency
    time      = var.time
  }

  instant_restore_retention_days = var.instant_retention_days

  retention_daily {
    count = var.retention_daily
  }

  retention_monthly {
    count    = var.retention_monthly
    weekdays = var.weekdays
    weeks    = var.weeks
  }

  tags = merge(
    local.common_tags,
    {
      Name        = "rsvbp-${var.project}-${var.environment}-01",
      Description = "A recovery service backup policy is created in the ${var.resource_group_name}."
    }
  )
}

#------------------------------------------------------------------
# Create backup protected vm
#------------------------------------------------------------------

resource "azurerm_backup_protected_vm" "backup_protected_vm" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.az_recovery_service_vault.name
  source_vm_id        = var.virtual_machine_id
  backup_policy_id    = azurerm_backup_policy_vm.az_backup_policy_vm.id

  tags = merge(
    local.common_tags,
    {
      Name        = "bpvm-${var.project}-${var.environment}-01",
      Description = "A backup protected vm is created in the ${var.resource_group_name}."
    }
  )
}

