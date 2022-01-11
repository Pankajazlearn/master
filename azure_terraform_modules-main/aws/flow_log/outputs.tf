#---------------------------
# AWS Flow Logs output
#---------------------------
output "aws_flow_logs_output" {
  value = aws_flow_log.aws_flow_log.id
  description = "The output of AWS Flow Logs"
}

