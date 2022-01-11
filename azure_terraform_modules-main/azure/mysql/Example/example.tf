# --------------------------------------------------------
# Provider Version
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
# - Create and manage MySQL Server and one or many MySQL Databases in Microsoft Azure.
# -

module "mysql_example" {
  
  source = "../"

  resource_group_name                     = var.resource_group_name
  key_vault_resource_group_name           = var.key_vault_resource_group_name
  storage_account_resource_group_name     = var.storage_account_resource_group_name
  database_names                          = var.database_names
  storage_account_name                    = var.storage_account_name
  server_name                             = var.server_name 
  key_vault_name                          = var.key_vault_name
  Azure_AD_Authentication_User_Login_Name = var.Azure_AD_Authentication_User_Login_Name
  ssl_minimal_tls_version                 = var.ssl_minimal_tls_version
  email_addresses_for_alerts              = var.email_addresses_for_alerts
  tag_Environment     = "dev"
  tag_Project         = "test"
  tag_Owner           = "Sandeep"
  tag_BusinessUnit    = "MAF"
  tag_Confidentiality = "Sensitive"
  tag_OpCo            = "test"
}
