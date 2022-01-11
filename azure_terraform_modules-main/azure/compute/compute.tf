#-------------------------------------------------------------
# Data source for Azure image to provision the virtual machine
#-------------------------------------------------------------

data "azurerm_image" "az_packer_image" {
  name                = var.az_image_name
  resource_group_name = var.resource_group_name
}

#-------------------------------------------------------------
# Create Network interface card with ip_configurations
#-------------------------------------------------------------

resource "azurerm_network_interface" "az_network_interface_card" {
  name                          = "nic-${var.project}-${var.environment}-0${var.sequence_of_network_interface}"
  location                      = var.location
  resource_group_name           = var.resource_group_name
  enable_accelerated_networking = var.accelerated_networking

  ip_configuration {
    name                          = var.az_vnet_subnet_name
    subnet_id                     = var.az_vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = merge(
    local.common_tags,
    {
      Name        = "nic-${var.project}-${var.environment}-0${var.sequence_of_network_interface}",
      Description = "A Network interface card is created in the ${var.resource_group_name}"
    }
  )
}

#----------------------------------------------------------------
# Create Network Interface and Network Security Group Association
#----------------------------------------------------------------

resource "azurerm_network_interface_security_group_association" "az_network_interface_security_group_association" {
  network_interface_id      = azurerm_network_interface.az_network_interface_card.id
  network_security_group_id = var.az_nsg_id
}

#--------------------------------------------------------------
# Data source for storage account required for boot diagnostics 
#--------------------------------------------------------------

data "azurerm_storage_account" "az_storage_account" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

#--------------------------------------------------------------
# Data source for Availability set 
#--------------------------------------------------------------

data "azurerm_availability_set" "az_availability_set" {
  count               = (var.create_availability_set == false && var.vm_availability_set == true) ? 1 : 0
  name                = var.az_availability_set_name
  resource_group_name = var.resource_group_name
}

#-------------------------------------------------------------
# Create Azure availability set
#-------------------------------------------------------------

resource "azurerm_availability_set" "az_availability_set" {
  count               = (var.create_availability_set && var.vm_availability_set) ? 1 : 0
  name                = "as-${var.project}-${var.environment}-01"
  location            = var.location
  resource_group_name = var.resource_group_name
  platform_fault_domain_count = var.fault_domain_count

  tags = merge(
    local.common_tags,
    {
      Name            = "as-${var.project}-${var.environment}-01",
      Description     = "A Availability set is created in the ${var.resource_group_name}"
    }
  )
}

#-------------------------------------------------------------
# Create Azure virtual machine with managed data disk attached
#-------------------------------------------------------------

resource "azurerm_virtual_machine" "az_virtual_machine" {
  name                             = upper("${var.location-id}${var.client}${var.project}${var.device-role}${var.form-factor}${var.environment}0${var.sequence_of_virtual_machine}")
  location                         = var.location
  resource_group_name              = var.resource_group_name
  vm_size                          = var.vm_size
  network_interface_ids            = [azurerm_network_interface.az_network_interface_card.id]
  delete_os_disk_on_termination    = var.os_disk_termination
  delete_data_disks_on_termination = var.data_disk_termination
  availability_set_id              = var.vm_availability_set ? local.az_availability_set_id : null

  storage_image_reference {
    id = data.azurerm_image.az_packer_image.id
  }

  boot_diagnostics {
    enabled     = var.boot_diagnostics
    storage_uri = var.storage_account_uri
  }

  storage_os_disk {
    name              = "os-dsk-${var.location-id}${var.client}${var.project}${var.device-role}${var.form-factor}${var.environment}-01"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.username
    admin_password = data.azurerm_key_vault_secret.az_vm_password.value
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = merge(
    local.common_tags,
    {
      Name        = upper("${var.location-id}${var.client}${var.project}${var.device-role}${var.form-factor}${var.environment}0${var.sequence_of_virtual_machine}"),
      Description = "A Virtual machine is created in the ${var.resource_group_name}"
    }
  )
}

#---------------------------------------------------------------
# Create Azure managed disk and attach it to the virtual machine
#---------------------------------------------------------------

resource "azurerm_managed_disk" "az_managed_disk" {
  count                = var.number_of_disks
  name                 = "data-dsk-${var.location-id}${var.client}${var.project}${var.device-role}${var.form-factor}${var.environment}-${count.index + 1}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.managed_disk_size

  tags = merge(
    local.common_tags,
    {
      Name        = "data-dsk-${var.location-id}${var.client}${var.project}${var.device-role}${var.form-factor}${var.environment}-${count.index + 1}"
      Description = "A managed disk is created in the ${var.resource_group_name}"
    }
  )
}

#---------------------------------------------------------------
# Create Attachment of managed disk to virtual machine
#---------------------------------------------------------------

resource "azurerm_virtual_machine_data_disk_attachment" "az_data_disk_attachment" {
  count              = var.number_of_disks
  managed_disk_id    = azurerm_managed_disk.az_managed_disk.*.id[count.index]
  virtual_machine_id = azurerm_virtual_machine.az_virtual_machine.id
  lun                = 10 + count.index
  caching            = "ReadWrite"
}
