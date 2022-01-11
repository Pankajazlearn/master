output "db_subnet_group_id" {
  description = "The db subnet group name"
  value       = element(concat(aws_db_subnet_group.subnet_group.*.id, [""]), 0)
}

output "db_subnet_group_arn" {
  description = "The ARN of the db subnet group"
  value       = element(concat(aws_db_subnet_group.subnet_group.*.arn, [""]), 0)
}
