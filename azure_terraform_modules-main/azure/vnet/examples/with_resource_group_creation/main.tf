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

module "az_vnet" {
    source = "../../"

    environment         = var.environment
    owner               = var.owner
    business_unit       = var.business_unit
    project             = var.project
    operational_company = var.operational_company

    create_resource_group      = var.create_resource_group
    location                   = var.location
    location_abbreviation      = var.location_abbreviation
    az_vnet_sequence           = var.az_vnet_sequence
    az_vnet_cidr               = var.az_vnet_cidr
    az_dns_servers             = var.az_dns_servers
    az_resource_group_sequence = var.az_resource_group_sequence
}
