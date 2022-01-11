#-------------------
# Local declarations
#-------------------
locals {
  environment_location_infix = "${var.environment}-${var.aws_region}"
  project_envionment_infix   = "${var.project}-${var.environment}"

  common_tags = {
    Environment  = var.environment
    Project      = var.project
    Owner        = var.owner
    BusinessUnit = var.business_unit
    OpCo         = var.operational_company
  }
}
