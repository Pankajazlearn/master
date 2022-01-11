locals {
  az_availability_set_id = element(coalescelist(data.azurerm_availability_set.az_availability_set.*.id, azurerm_availability_set.az_availability_set.*.id, [""]), 0)

  common_tags = {
    Environment   = var.environment
    Project       = var.project
    Owner         = var.owner
    BusinessUnit = var.business_unit
    OpCo	  = var.operational_company
  }
}

