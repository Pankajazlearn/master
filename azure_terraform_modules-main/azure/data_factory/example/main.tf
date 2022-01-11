# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

module "azurerm_data_factory" {
  source = "../data_factory"

  ## Create or define the resource group to be used ###

  create_resource_group           = true
  az_resource_group_name          = "rg-iac-adf"
  location                        = "West Europe"
  public_network_enabled          = false
  managed_virtual_network_enabled = false

  ## Define tags ###
  project              = "iac"
  environment          = "dev"
  business_unit        = "gs"
  owner                = "santhosh.palanivel"
  technical_contact    = "santhosh.palanivel"
  operational_company  = "mafgs"

}

