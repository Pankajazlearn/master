#----------------------------------------------
# The Output of Network COntrol List
#----------------------------------------------
output "aws_nacl_id_output" {
  value = aws_network_acl.aws_network_acl.id
  description = "The output of Network Access Control List ID"
}

