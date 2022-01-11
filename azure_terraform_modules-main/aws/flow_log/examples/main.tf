provider "aws" {
}

module "flow_log" {
  source = "../"

  aws_region          = var.aws_region
  environment         = var.environment
  project             = var.project
  business_unit       = var.business_unit
  owner               = var.owner
  operational_company = var.operational_company
  aws_vpc_id          = "xxxxxxxxxxxxxx"
  count_of_s3_bucket  = 1
  aws_s3_bucket_arn   = "arn:aws:s3:::xxxxxxxxxx"
}

