provider "azurerm" {
  features {}
}

module "service_principal" {
  source = "../"
}
