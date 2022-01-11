locals {
  allowed_services = distinct(var.allowed_services)
    common_tags = {
    Environment     = var.environment
    Project         = var.project
    Owner           = var.owner
    BusinessUnit    = var.business_unit
    OpCo            = var.operational_company
    Confidentiality = var.confidentiality
    TechnicalOwner  = var.technical_owner
  }
}
