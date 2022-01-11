#-----------------------------------------------
# Output of Route Table
#-----------------------------------------------

output "aws_route_table_id" {
  value = aws_route_table.aws_route_table.id
  description = "Output of Route Table ID"
}
