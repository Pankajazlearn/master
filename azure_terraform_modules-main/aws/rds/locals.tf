locals {
  identifier           = "rds-${var.engine}-${var.project}-${var.environment}"
  master_password      = var.create_db_instance && var.create_random_password ? random_password.master_password[0].result : var.password
  db_subnet_group_name = !var.cross_region_replica && var.replicate_source_db != null ? null : coalesce(var.db_subnet_group_name, module.db_subnet_group.db_subnet_group_id, "rds-${var.engine}-${var.project}-${var.environment}")

  parameter_group_name_id = var.create_db_parameter_group ? module.db_parameter_group.db_parameter_group_id : var.parameter_group_name

  create_db_option_group = var.create_db_option_group && var.engine != "postgres"
  option_group           = local.create_db_option_group ? module.db_option_group.db_option_group_id : var.option_group_name
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
