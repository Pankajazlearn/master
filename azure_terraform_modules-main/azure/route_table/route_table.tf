#-----------------------------------------
# Route Table creation - default is "true"
#-----------------------------------------
resource "azurerm_route_table" "az_route_table" {
  name                            = "route-${var.az_route_table_name}"
  location                        = var.location
  resource_group_name             = var.az_resource_group_name
  disable_bgp_route_propagation   = false


  dynamic "route" {
    for_each                      = var.az_route_table_routes
    content {
      name                        = lookup(route.value, "name", "")
      address_prefix              = lookup(route.value, "address_prefix", "")
      next_hop_type               = lookup(route.value, "next_hop_type", "VirtualAppliance")
      next_hop_in_ip_address      = lookup(route.value, "next_hop_in_ip_address", null)

    }
  }

  tags                            = merge(
    local.common_tags,
    {
      Name                        = "route-${var.az_route_table_name}"
      Description                 = "Route table with ${length(var.az_route_table_routes)} routes."
    }  
  )
}
