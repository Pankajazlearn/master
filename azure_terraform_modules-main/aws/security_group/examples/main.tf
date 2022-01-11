provider "aws" {
}

module "security_group" {
  source = "../"

  aws_region                 = var.aws_region
  environment                = var.environment
  project                    = var.project
  business_unit              = var.business_unit
  owner                      = var.owner
  operational_company        = var.operational_company
  aws_vpc_id                 = "xxxxxxxxxxxxxxxxxx"
  aws_security_group_ingress = var.aws_security_group_ingress
  aws_security_group_egress  = var.aws_security_group_egress

}

