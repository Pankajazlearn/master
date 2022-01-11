terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.59.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}

module "test_diag" {
  source = "../"
  resource_id = var.resource_id
  logs_destinations_ids = var.logs_destinations_ids
  log_categories = [
    "MySqlSlowLogs",
    "MySqlAuditLogs",
  ]
  metric_categories = [
    "AllMetrics"
  ]
}
