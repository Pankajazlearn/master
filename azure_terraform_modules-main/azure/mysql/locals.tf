# -
# - Tags
# -

locals {
  common_tags = {
    Environment     = var.tag_Environment
    Project         = var.tag_Project
    Owner           = var.tag_Owner
    BusinessUnit    = var.tag_BusinessUnit
    OpCo            = var.tag_OpCo
    Confidentiality = var.tag_Confidentiality
  }
  
  administrator_login_password = var.administrator_login_password == null ? random_password.password.result : var.administrator_login_password

  key_permissions         = ["get", "wrapkey", "unwrapkey"]
  secret_permissions      = ["get"]
  certificate_permissions = ["get"]
  storage_permissions     = ["get"]
}
