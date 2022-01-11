#-------------------------
# Output of Network (s) ID 
#-------------------------

output "network_id" {
  description = "Project Network ID "
  value       = { for key, value in openstack_networking_network_v2.project_network : value.name => value.id }

}

#-------------------------
# Output of Subents (s) ID 
#-------------------------

output "subnet_id" {
  description = "Project Network-Subnet ID "
  value       = { for key, value in openstack_networking_subnet_v2.project_network_subnet : value.name => value.id }
}
