#----------------------------------
# New Network Interface ID output
#----------------------------------

output "aws_network_interface_id_output" {
  description = "ID of newly created Network Interface."
  value = aws_network_interface.aws_network_interface.id
}
