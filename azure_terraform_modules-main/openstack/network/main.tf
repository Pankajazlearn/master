#-------------------
# Create Network (s) 
#-------------------

resource "openstack_networking_network_v2" "project_network" {
  for_each       = var.networklist
  name           = each.value.name
  admin_state_up = "true"
  tenant_id      = var.tenant_id
  /*
segments{
physical_network="physnet1"
network_type=  "vlan"
segmentation_id ="100"
}*/
}

#------------------
# Create Subnet (s) 
#------------------

resource "openstack_networking_subnet_v2" "project_network_subnet" {

  for_each    = openstack_networking_network_v2.project_network
  name        = var.networklist[each.key].subnets.name
  network_id  = each.value.id
  cidr        = var.networklist[each.key].subnets.subnet
  ip_version  = 4
  enable_dhcp = false
}
