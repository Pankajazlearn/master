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

module "Private_endpoints" {
  source              = "../"
  resource_group_name = "test-sandy-rg"

  private_endpoints = {
    pe1 = {
      resource_name                 = "test-sandy-rg" # Mysql Server name
      name                          = "mysql-testapp-prod-pe" # Private Endpoint name
      subnet_id                     = "/subscriptions/646497f2-cf94-40d9-9ea0-0bb44fcce127/resourceGroups/test-sandy-rg/providers/Microsoft.Network/virtualNetworks/vnet-test-pe-01/subnets/subnet-test-pe-01"
      subnet_name                   = "subnet-test-pe-01"
      vnet_name                     = "vnet-test-pe-01"
      networking_resource_group     = "test-sandy-rg"
      group_ids                     = ["mysqlserver"]
      approval_required             = false
      approval_message              = null
      dns_zone_names                = null 
      dns_rg_name                   = null
      dns_zone_group_name           = null
      private_connection_address_id = "/subscriptions/646497f2-cf94-40d9-9ea0-0bb44fcce127/resourceGroups/test-menna3/providers/Microsoft.DBforMySQL/servers/mysql-testapp-prod"
    }
  }
  tag_Environment     = "dev"
  tag_Project         = "test"
  tag_Owner           = "Sandeep"
  tag_BusinessUnit    = "MAF"
  tag_Confidentiality = "Sensitive"
  tag_OpCo            = "test"
}
