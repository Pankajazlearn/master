terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.90.0"
    }
  }
  required_version = ">= 1.0.9"
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {}

  alias           = "management_subscription"
  subscription_id = "xxxx-xxxx"
}

#-----------------------------------------------------------
# Existing Storage Account Data from Management Subscription
#-----------------------------------------------------------

data "azurerm_storage_account" "az_storage_account_data" {
  provider            = azurerm.management_subscription
  name                = var.az_storage_account_name
  resource_group_name = var.az_storage_account_resource_group_name
}

module "az_network_flow_log" {
    source = "../../"

    environment         = var.environment
    owner               = var.owner
    business_unit       = var.business_unit
    project             = var.project
    operational_company = var.operational_company

    location                               = var.location
    location_abbreviation                  = var.location_abbreviation
    az_nsg_id                              = var.az_nsg_id
    az_storage_account_name                = var.az_storage_account_name
    az_storage_account_resource_group_name = var.az_storage_account_resource_group_name
    az_network_watcher_flow_log_sequence   = var.az_network_watcher_flow_log_sequence
    az_storage_account_data_id             = data.azurerm_storage_account.az_storage_account_data.id
    create_network_watcher                 = var.create_network_watcher
}
