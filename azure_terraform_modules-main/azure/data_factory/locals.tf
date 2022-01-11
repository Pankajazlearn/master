#-------------------
# Local declarations
#-------------------

locals { 
  resource_group_name        = element(coalescelist(data.azurerm_resource_group.az_resource_group.*.name, azurerm_resource_group.az_resource_group.*.name, [""]), 0)
  project_envionment_infix   = "${var.project}-${var.environment}"

  common_tags = {
    Environment       = var.environment
    Project           = var.project
    Owner             = var.owner
    BusinessUnit      = var.business_unit
    OpCo              = var.operational_company
    Technical_contact = var.technical_contact

  }
}
