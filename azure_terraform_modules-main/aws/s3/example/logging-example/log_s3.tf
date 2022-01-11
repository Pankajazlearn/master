
locals {
  log_bucket_name = "s3-log-dev-euw1-${random_uuid.this.result}"

}

module "s3_bucket_log" {
  source                                = "../../"
  bucket                                = local.log_bucket_name
  acl                                   = "log-delivery-write"
  force_destroy                         = true
  environment                           = "POC"
  business_unit                         = "share"
  owner                                 = "menna.ammar@gmail.com"
  operational_company                   = "share"
  project                               = "POC"
  technical_owner                       = "menna.ammar@gmail.com"
  confidentiality                       = "Internal"
  attach_deny_insecure_transport_policy = true
  versioning = {
    enabled    = true
    mfa_delete = false
  }

  lifecycle_rule = [
    {
      id      = "log"
      enabled = true
      prefix  = "log/"

      tags = {
        rule      = "log"
        autoclean = "true"
      }

      transition = [
        {
          days          = 30
          storage_class = "ONEZONE_IA"
          }, {
          days          = 60
          storage_class = "GLACIER"
        }
      ]

      expiration = {
        days = 90
      }

      noncurrent_version_expiration = {
        days = 30
      }
    },
    {
      id                                     = "log1"
      enabled                                = true
      prefix                                 = "log1/"
      abort_incomplete_multipart_upload_days = 7

      noncurrent_version_transition = [
        {
          days          = 30
          storage_class = "STANDARD_IA"
        },
        {
          days          = 60
          storage_class = "ONEZONE_IA"
        },
        {
          days          = 90
          storage_class = "GLACIER"
        },
      ]

      noncurrent_version_expiration = {
        days = 300
      }
    },
  ]

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
}
