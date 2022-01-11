provider "aws" {
}

module "aws_subnet" {
  source = "../"

  aws_region          = var.aws_region
  environment         = var.environment
  project             = var.project
  business_unit       = var.business_unit
  owner               = var.owner
  operational_company = var.operational_company
  aws_cidr_vpc        = "10.100.216.0/24"
  aws_cidr_subnet     = ["10.100.216.0/26", "10.100.216.64/26", "10.100.216.128/26"]
  aws_vpc_id          = "xxxxxxxxxxxxxxxxx"
}

