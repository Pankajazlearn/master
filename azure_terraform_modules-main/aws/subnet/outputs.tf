#--------------------
# New Subnet/s Output
#--------------------

output "aws_subnet" {
  value = aws_subnet.aws_subnet
}

#-----------------------
# New Subnet id/s output
#-----------------------

output "aws_subnet_id_output" {
  value = toset([
    for aws_subnet in aws_subnet.aws_subnet: aws_subnet.id
  ])
}
