locals {

  common_tags = {
    Environment   = var.environment
    Project       = var.project
    Owner         = var.owner
    BusinessUnit  = var.business_unit
    OpCo	  = var.operational_company
  }
}
