#-------------------------------------------------
# Create AWS Flow Log
#-------------------------------------------------

resource "aws_flow_log" "aws_flow_log" {
  log_destination      = var.aws_s3_bucket_arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = var.aws_vpc_id

  tags = merge(
    local.common_tags,
    {
      Name        = "fl-${var.project}-${var.aws_region}",
      Description = "AWS Flow log is created to capture the IP traffic of Interface, Subnet or VPC"
    }
  )
}
