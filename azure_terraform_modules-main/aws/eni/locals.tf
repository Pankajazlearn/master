locals {
  ec2_instance_name = upper(var.aws_ec2_instance_name)

  common_tags = {
    Environment  = var.environment
    Project      = var.project
    Owner        = var.owner
    BusinessUnit = var.business_unit
    OpCo         = var.operational_company
  }
}
