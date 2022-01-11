# --------------------------------------------------------
# Provider version
# --------------------------------------------------------
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

# -
# - Create Resource Groups and assign mandatory tags
# -
module "rg_test" {
  source          = "../"
  resource_groups = var.resource_groups
}
