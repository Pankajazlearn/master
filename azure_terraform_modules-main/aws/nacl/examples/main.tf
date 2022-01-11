provider "aws" {
}

module "nacl" {
  source = "../"

  aws_region          = var.aws_region
  environment         = var.environment
  project             = var.project
  business_unit       = var.business_unit
  owner               = var.owner
  operational_company = var.operational_company
  aws_vpc_id          = "xxxxxxxxxxxxxxxxx"
  aws_subnet_ids      = "xxxxxxxxxxxxxxxxx"
  sequence_of_nacl    = 1
  ingress_destination_port = 80
  ingress_source_port      = 80
  ingress_cidr_block       = "10.0.0.0/16"
  ingress_action           = "allow"
  egress_destination_port  = 443
  egress_source_port       = 443
  egress_cidr_block        = "10.0.0.0/16"
  egress_action            = "allow"

}

