# #############################################################################
# # OUTPUTS Private Endpoint
# #############################################################################

output "private_endpoint_ids" {
  value       = [for pe in azurerm_private_endpoint.private_endpoint : pe.id]
  description = "Private Endpoint Id's"
}

output "private_ip_addresses_map" {
  value       = { for pe in azurerm_private_endpoint.private_endpoint : pe.name => pe.private_service_connection.*.private_ip_address }
  description = "Map of Private Endpoint IP Addresses"
}

output "private_ip_addresses_acr_map" {
  value       = { for pe in azurerm_private_endpoint.private_endpoint : pe.name => pe.custom_dns_configs.*.ip_addresses }
  description = "Map of Private Endpoint IP Addresses for ACR"
}
