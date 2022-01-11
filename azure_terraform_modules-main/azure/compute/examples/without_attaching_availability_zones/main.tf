provider "azurerm" {
  features {
}
}

module "az_compute" {
  source              = "../../"
  resource_group_name = "sql_vm_test"
  location            = "uaenorth"
  az_vnet_subnet_id   = "xxxxxxxxxxxxxxxxxxxxx"
  environment         = "dev"
  project             = "bu"
  business_unit       = "bu"
  owner               = "self"
  operational_company = "mi"
  az_image_name       = "az-ubuntu-18.04-base-20211117"
  key_vault_name      = "newazkeyvault3455656"
  key_vault_secret    = "vmpassword"
  os_disk_termination = true
  data_disk_termination = true
  vm_name             = "compute"
  username            = "compute"
  vm_size             = "Standard_D2s_v3"
  boot_diagnostics    = false
  create_availability_set = false
  az_availability_set_name = "as"
  vm_availability_set = false
  accelerated_networking = false
  number_of_disks    = 2
  managed_disk_size  = 2
  location-id        = "mi"
  client             = "AA"
  device-role        = "VM"
  form-factor        = "MI"
  storage_account_name = "storageacc454545"
  fault_domain_count = 2
  az_vnet_subnet_name = "default"
  az_nsg_id          = "xxxxxxxxxxxxxxxxxxxx"

}
