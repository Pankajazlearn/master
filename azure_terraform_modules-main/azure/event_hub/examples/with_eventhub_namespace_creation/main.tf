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

module "az_eventhub" {
    source = "../../"

    environment         = var.environment
    owner               = var.owner
    business_unit       = var.business_unit
    project             = var.project
    operational_company = var.operational_company
    
    location                       = var.location
    location_abbreviation          = var.location_abbreviation
    create_eventhub_namespace      = var.create_eventhub_namespace
    az_resource_group_name         = var.az_resource_group_name
    application_name               = var.application_name
    az_eventhub_namespace_sequence = var.az_eventhub_namespace_sequence
    az_eventhub_sequence           = var.az_eventhub_sequence
    az_eventhub_namespace_sku      = var.az_eventhub_namespace_sku
    az_eventhub_namespace_capacity = var.az_eventhub_namespace_capacity
    az_eventhub_partition_count    = var.az_eventhub_partition_count
    az_eventhub_message_retention  = var.az_eventhub_message_retention
}
