#-------------------------------------------
# Output for Service principal
#-------------------------------------------

output "service_principal_output" {
  description = "ID of service principal created"
  value       = azuread_service_principal.az_service_principal
}
