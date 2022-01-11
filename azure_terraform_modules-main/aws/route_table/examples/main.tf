provider "aws" {
}

module "route_table" {
  source = "../"

  aws_region                 = var.aws_region
  environment                = var.environment
  project                    = var.project
  business_unit              = var.business_unit
  owner                      = var.owner
  operational_company        = var.operational_company
  aws_transit_gateway_id     = "subnet-04941035f8e229687"
  aws_subnet_ids             = ["subnet-04axxxxxxx", "subnet-095xxxxxxxxxx", "subnet-049xxxxxxxxx"]
  aws_vpc_id                 = "xxxxxxxxxxxxxxxxx"
  aws_cidr_block_route_table = "0.0.0.0/0"
  aws_cidr_vpc               = "10.0.0.0/16"
  aws_route_table_name       = "route_table"
}
