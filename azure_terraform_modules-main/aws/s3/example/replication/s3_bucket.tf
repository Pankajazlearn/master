provider "aws" {
  region = local.origin_region
}

provider "aws" {
  region = local.replica_region

  alias = "replica"
}

data "aws_caller_identity" "current" {}

resource "random_uuid" "this" {}

module "replica_bucket" {
  source = "../../"

  providers = {
    aws = aws.replica
  }
  environment             = "POC"
  business_unit           = "share"
  owner                   = "menna.ammar@gmail.com"
  operational_company     = "share"
  project                 = "POC"
  technical_owner         = "menna.ammar@gmail.com"
  confidentiality         = "Internal"
  bucket                  = local.destination_bucket_name
  acl                     = "private"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  versioning = {
    enabled = true
  }
}
data "aws_kms_key" "s3" {
  key_id = "alias/aws/s3"
}

module "s3_bucket_org" {
  source = "../../"
  bucket = local.bucket_name
  acl    = "private"

  versioning = {
    enabled = true
  }
  environment             = "POC"
  business_unit           = "share"
  owner                   = "menna.ammar@gmail.com"
  operational_company     = "share"
  project                 = "POC"
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  technical_owner         = "menna.ammar@gmail.com"
  confidentiality         = "Internal"
  replication_configuration = {
    role = aws_iam_role.replication.arn

    rules = [
      {
        id       = "something-with-kms-and-filter"
        status   = "Enabled"
        priority = 10

        source_selection_criteria = {
          sse_kms_encrypted_objects = {
            enabled = true
          }
        }

        filter = {
          prefix = "one"
          tags = {
            ReplicateMe = "Yes"
          }
        }

        destination = {
          bucket             = "arn:aws:s3:::${local.destination_bucket_name}"
          storage_class      = "STANDARD"
          replica_kms_key_id = data.aws_kms_key.s3.arn
          account_id         = data.aws_caller_identity.current.account_id
          access_control_translation = {
            owner = "Destination"
          }
          replication_time = {
            status  = "Enabled"
            minutes = 15
          }
          metrics = {
            status  = "Enabled"
            minutes = 15
          }
        }
      },
      {
        id       = "something-with-filter"
        status   = "Enabled"
        priority = 20

        filter = {
          prefix = "two"
          tags = {
            ReplicateMe = "Yes"
          }
        }

        destination = {
          bucket        = "arn:aws:s3:::${local.destination_bucket_name}"
          storage_class = "STANDARD"
          replication_time = {
            status  = "Enabled"
            minutes = 15
          }
          metrics = {
            status  = "Enabled"
            minutes = 15
          }
        }
      },
      {
        id       = "everything-with-filter"
        status   = "Enabled"
        priority = 30

        filter = {
          prefix = ""
        }

        destination = {
          bucket        = "arn:aws:s3:::${local.destination_bucket_name}"
          storage_class = "STANDARD"
          replication_time = {
            status  = "Enabled"
            minutes = 15
          }
          metrics = {
            status  = "Enabled"
            minutes = 15
          }
        }
      },
      {
        id     = "everything-without-filters"
        status = "Enabled"

        destination = {
          bucket        = "arn:aws:s3:::${local.destination_bucket_name}"
          storage_class = "STANDARD"
          replication_time = {
            status  = "Enabled"
            minutes = 15
          }
          metrics = {
            status  = "Enabled"
            minutes = 15
          }
        }
      },
    ]
  }

}
