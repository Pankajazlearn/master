provider "azurerm" {
  features {}
}

module "az_vm_backup" {
  source              = "../"
  resource_group_name = "sql_vm_test"
  location            = "uaenorth"
  virtual_machine_id  = "xxxxxxxxxx"
  environment         = "dev"
  project             = "bu"
  business_unit       = "mi"
  owner               = "self"
  operational_company = "mi"
}

