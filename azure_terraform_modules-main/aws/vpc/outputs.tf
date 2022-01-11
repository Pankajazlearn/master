#---------------------------
# New Virtual Private Cloud Output
#---------------------------
output "aws_vpc_id_output" {
  value = aws_vpc.aws_vpc.id
  description = "The output of VPC ID"
}
