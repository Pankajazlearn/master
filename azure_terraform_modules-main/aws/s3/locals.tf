locals {

  attach_policy = var.attach_deny_insecure_transport_policy || var.restrict_access_vpce
  common_tags = {
    Environment  = var.environment
    Project      = var.project
    Owner        = var.owner
    BusinessUnit = var.business_unit
    OpCo         = var.operational_company
    Confidentiality=var.confidentiality
    TechnicalOwner= var.technical_owner
  }
}
