locals {
  role_sts_externalid = flatten([var.role_sts_externalid])
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
