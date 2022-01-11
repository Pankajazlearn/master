provider "aws" {
}

module "aws_vpc" {
  source = "../"
  aws_region          = "eu-west-1"
  environment         = "dev"
  project             = "bu"
  business_unit       = "mi"
  owner               = "self"
  operational_company = "mi"
  aws_cidr_vpc        = "10.0.0.0/16"
}

