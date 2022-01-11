#---------------------------------------------
# Pre-existing Resource Group Name 
#---------------------------------------------

data "azurerm_resource_group" "az_resource_group" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.az_resource_group_name
}

#---------------------------------------------
# Resource Group creation - Default is "false"
#---------------------------------------------

resource "azurerm_resource_group" "az_resource_group" {
  count    = var.create_resource_group ? 1 : 0
  name  = var.az_resource_group_name
  location = var.location
}

#---------------------------------------------
# Datafactory creation 
#---------------------------------------------

resource "azurerm_data_factory" "adf" {
    name                            = "adf-${local.project_envionment_infix}-001"
    location                        = var.location
    resource_group_name             = local.resource_group_name
    public_network_enabled          = var.public_network_enabled
    managed_virtual_network_enabled = var.managed_virtual_network_enabled

    tags = merge(
    local.common_tags,
        {
            Name        = "adf-${local.project_envionment_infix}-001",
        }
    )
}
