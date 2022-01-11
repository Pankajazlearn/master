##----------------------------
##  Create Flavor
##----------------------------

resource "openstack_compute_flavor_v2" "VM_flavor" {

 for_each   = var.falvorlist
  name      = each.value.name
  ram       = each.value.ram
  vcpus     = each.value.vcpu
  disk      = each.value.disk

 extra_specs =  each.value.extra_specs

}

resource "openstack_compute_flavor_access_v2" "assign_falvor_project" {
 # tenant_id = "${openstack_identity_project_v3.project_name.id}"
  for_each =   openstack_compute_flavor_v2.VM_flavor
  flavor_id = each.value.id
}
