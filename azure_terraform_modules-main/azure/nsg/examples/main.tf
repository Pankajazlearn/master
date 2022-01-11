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

module "az_nsg" {
    source = "../"

    environment            = var.environment
    owner                  = var.owner
    business_unit          = var.business_unit
    project                = var.project
    operational_company    = var.operational_company

    location               = var.location
    az_resource_group_name = var.az_resource_group_name
    az_nsg_sequence        = var.az_nsg_sequence
}
