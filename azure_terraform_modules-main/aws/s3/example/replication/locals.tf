locals {
  bucket_name             = "origin-s3-bucket-${random_uuid.this.id}"
  destination_bucket_name = "replica-s3-bucket-${random_uuid.this.id}"
  origin_region           = "eu-west-1"
  replica_region          = "eu-west-1"
}
