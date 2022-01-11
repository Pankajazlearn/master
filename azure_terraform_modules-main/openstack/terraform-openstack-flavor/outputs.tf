output "flavor_names" {
  description = ""
  value       = ["${openstack_compute_flavor_v2.teleco.*.name}"]
}
