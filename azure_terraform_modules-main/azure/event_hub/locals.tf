#------------------------
# Local declarations
#------------------------

locals {
  az_eventhub_namespace_name        = element(coalescelist(azurerm_eventhub_namespace.az_eventhub_namespace.*.name, data.azurerm_eventhub_namespace.az_eventhub_namespace.*.name, [""]), 0)
  
  environment_location_infix = "${var.environment}-${var.location}"
  project_envionment_infix   = "${var.project}-${var.environment}"

  common_tags = {
    Environment  = var.environment
    Project      = var.project
    Owner        = var.owner
    BusinessUnit = var.business_unit
    OpCo         = var.operational_company
  }
}
