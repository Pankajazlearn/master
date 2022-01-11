#-------------------------------------------
# Output of Security Group
#-------------------------------------------

output "aws_security_group_output" {
  value     = aws_security_group.aws_security_group.id
  description = "The Output of Security Group"
}
