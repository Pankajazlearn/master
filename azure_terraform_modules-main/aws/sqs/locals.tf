#------------------------
# Local declarations
#------------------------

locals {
  common_tags = {
    Environment  = var.tag_Environment
    Project      = var.tag_Project
    Owner        = var.tag_Owner
    BusinessUnit = var.tag_BusinessUnit
    OpCo         = var.tag_OpCo
  }
}
