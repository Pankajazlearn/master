
locals {
  bucket_name = "s3-dev-euw1-${random_uuid.this.result}"

}

resource "random_uuid" "this" {}

module "s3_bucket" {
  source                                = "../../"
  bucket                                = local.bucket_name
  acl                                   = "private"
  force_destroy                         = true
  attach_deny_insecure_transport_policy = true
  environment                           = "POC"
  business_unit                         = "share"
  owner                                 = "menna.ammar@gmail.com"
  operational_company                   = "share"
  project                               = "POC"
  technical_owner                       = "menna.ammar@gmail.com"
  confidentiality                       = "Internal"
  versioning = {
    enabled = true

  }
  restrict_access_vpce  = true
  allowed_vpc_endpoints = ["vpce-07345eb4ab45b3b70"]

  logging = {
    target_bucket = module.s3_bucket_log.s3_bucket_id
    target_prefix = "log/"

  }


  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {

        sse_algorithm = "AES256"
      }
    }
  }


  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  # S3 Bucket Ownership Controls
  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"
  depends_on               = [module.s3_bucket_log]
}
