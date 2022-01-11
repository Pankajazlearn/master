locals {
  volume_count      = var.aws_secondary_volume_count > 0 ? var.aws_secondary_volume_count : 0
  availability_zone = var.availability_zone != "" ? var.availability_zone : data.aws_subnet.aws_subnet_data.availability_zone
  ec2_instance_name = upper("${var.location_code}${var.client_code}${var.project}${var.device_role}V${var.environment_code}${var.aws_ec2_instance_sequence}")

  common_tags = {
    Environment  = var.environment
    Project      = var.project
    Owner        = var.owner
    BusinessUnit = var.business_unit
    OpCo         = var.operational_company
  }
}

