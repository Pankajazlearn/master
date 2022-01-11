#-------------------------------------------------------------
# Data source for Azure Virtual Network
#-------------------------------------------------------------

data "azurerm_virtual_network" "az_virtual_network" {
  name                = var.az_virtual_network_name
  resource_group_name = var.az_resource_group_name
}

#-------------------------------------------------------------------
# Creation of Random Password for Azure SQL Virtual Machine Password
#-------------------------------------------------------------------

resource "random_password" "az_random_vmpassword" {
  length = var.az_random_vmpassword_length
  special = true
}

#-------------------------------------------------------------
# Creation of Keyvault Secret 
#-------------------------------------------------------------

resource "azurerm_key_vault_secret" "az_keyvault_secret" {
  name         = var.az_keyvault_secret_name
  value        = random_password.az_random_vmpassword.result
  key_vault_id = var.az_keyvault_id

  tags = merge(
    local.common_tags,
    {
      Name        = "kv-${var.project}-${var.environment}-01",
      Description = "Azure Keyvault secret for SQL VM in ${var.az_resource_group_name}"
    }
  )
}

#-------------------------------------------------------------
# Creation of Network interface card with ip_configurations
#-------------------------------------------------------------

resource "azurerm_network_interface" "az_network_interface_card" {
  name                          = "nic-${var.project}-${var.environment}-0${var.sequence_of_network_card}"
  location                      = var.location
  resource_group_name           = var.az_resource_group_name
  enable_accelerated_networking = var.accelerated_networking

  ip_configuration {
    name                          = var.az_ip_configuration_name
    subnet_id                     = var.az_subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = merge(
    local.common_tags,
    {
      Name        = "nic-${var.project}-${var.environment}-0${var.sequence_of_network_card}",
      Description = "A Network Card for Virtual machine in ${var.az_resource_group_name}"
    }
  )
}

#-------------------------------------------------------------
# Association of Network Interface card and NSG
#-------------------------------------------------------------

resource "azurerm_network_interface_security_group_association" "az_network_interface_security_group_association" {
  network_interface_id      = azurerm_network_interface.az_network_interface_card.id
  network_security_group_id = module.nsg.az_nsg_id_output

  depends_on = [
    module.nsg
  ]
}

#-------------------------------------------------------------
# Reference of NSG Module to add security rule of RDP
#-------------------------------------------------------------

module "nsg" {
  source = "../nsg/"

  az_resource_group_name = var.az_resource_group_name
  location               = var.location
  environment            = var.environment
  project                = var.project
  business_unit          = var.business_unit
  owner                  = var.owner
  operational_company    = var.operational_company
  default_network_security_group_inbound = var.default_network_security_group_inbound
  default_network_security_group_outbound = var.default_network_security_group_outbound
  az_nsg_sequence        = var.az_nsg_sequence
}


#-------------------------------------------------------------
# Creation of Azure Virtual Machine
#-------------------------------------------------------------

resource "azurerm_virtual_machine" "az_virtual_machine" {
  name                  = upper("${var.location-id}${var.client}${var.project}${var.device-role}${var.form-factor}${var.environment}0${var.sequence_of_virtual_machine}")
  location              = var.location
  resource_group_name   = var.az_resource_group_name
  network_interface_ids = [azurerm_network_interface.az_network_interface_card.id]
  vm_size               = var.az_vmsize
  delete_os_disk_on_termination = var.delete_os_on_termination_flag

  storage_image_reference {
    publisher = var.az_image_publisher
    offer     = var.az_image_offer
    sku       = var.az_image_sku
    version   = var.az_image_version
  }

  boot_diagnostics {
    enabled     = var.az_boot_diagnostics_flag
    storage_uri = var.az_storage_account_uri
  }

  storage_os_disk {
    name              = "os-dsk-${var.location-id}${var.client}${var.project}${var.device-role}${var.form-factor}${var.environment}-01"
    caching           = "ReadOnly"
    create_option     = "FromImage"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = var.az_computer_name
    admin_username = var.az_vm_username
    admin_password = azurerm_key_vault_secret.az_keyvault_secret.value
  }

  os_profile_windows_config {
    timezone                  = "Pacific Standard Time"
    provision_vm_agent        = true
    enable_automatic_upgrades = true
  }

  tags = merge(
    local.common_tags,
    {
      Name        = upper("${var.location-id}${var.client}${var.project}${var.device-role}${var.form-factor}${var.environment}0${var.sequence_of_virtual_machine}"),
      Description = "Creation of Virtual machine in ${var.az_resource_group_name}"
    }
  )
}

#-------------------------------------------------------------
# Creation of Azure SQL Virtual Machine
#-------------------------------------------------------------

resource "azurerm_mssql_virtual_machine" "az_mssql_virtual_machine" {
  virtual_machine_id = azurerm_virtual_machine.az_virtual_machine.id
  sql_license_type   = var.az_sql_license_type
  sql_connectivity_port            = var.az_sql_connectivity_port
  sql_connectivity_type            = var.az_sql_connectivity_type
  sql_connectivity_update_password = var.az_sql_connectivity_update_password
  sql_connectivity_update_username = var.az_sql_connectivity_update_username

  key_vault_credential {
    name                     = var.az_keyvault_name
    key_vault_url            = var.az_key_vault_url
    service_principal_name   = var.az_service_principal_name
    service_principal_secret = var.client_secret
  }

  auto_patching {
    day_of_week                            = var.az_patching_day_of_week
    maintenance_window_duration_in_minutes = var.az_patching_maintenance_duration_mins
    maintenance_window_starting_hour       = var.az_patching_maintenance_starting_hour
  }


  dynamic "auto_backup" {

    for_each = var.is_backup_enabled ? toset([1]) : toset([])

    content {
        encryption_enabled              = var.az_encryption_enabled_flag
        encryption_password             = var.az_encryption_password
        retention_period_in_days        = var.az_retention_period
        system_databases_backup_enabled = var.az_system_databases_backup_enabled_flag
        storage_blob_endpoint           = var.az_storage_blob_endpoint
        storage_account_access_key      = var.az_storage_account_access_key
  }
}
  tags = merge(
    local.common_tags,
    {
      Name        = upper("${var.location-id}${var.client}${var.project}${var.device-role}${var.form-factor}${var.environment}0${var.sequence_of_mssql_virtual_machine}"),
      Description = "Creation of SQL Virtual machine in ${var.az_resource_group_name}"
    }
  )
}
