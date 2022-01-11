##---------------------
## output of flavor
##---------------------

output "flavor_name" {
  description = "Flavor Name "
  value ={for key, value in openstack_compute_flavor_v2.VM_flavor: value.name=> value.id}

}

