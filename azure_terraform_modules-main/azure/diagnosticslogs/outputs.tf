# #############################################################################
# # OUTPUTS Diagnostic Logs
# #############################################################################

output "diagnostic_resource_id" {
  description = "ID of the Diagnostic resource."
  value       = var.resource_id
}

output "logs_destinations_ids" {
  description = "ID of Destination resources."
  value       = var.logs_destinations_ids
}
