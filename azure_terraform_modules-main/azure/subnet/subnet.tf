#------------------------
# Create Subnet Network/s
#------------------------

resource "azurerm_subnet" "az_subnet" {
  for_each             = toset(split(",", var.az_subnet_cidr))
  name                 = "snet-${var.environment}-${var.location_abbreviation}-00${index(tolist((split(",", trimspace(var.az_subnet_cidr)))), each.value) + var.az_subnet_sequence}"
  virtual_network_name = var.az_vnet_name
  resource_group_name  = var.az_resource_group_name
  address_prefixes     = [trimspace(each.key)]
}

#--------------------------------
# Create Subnet & NSG Association
#--------------------------------

resource "azurerm_subnet_network_security_group_association" "az_subnet_network_security_group_association" {
  for_each                  = toset(split(",", var.az_subnet_cidr))
  subnet_id                 = azurerm_subnet.az_subnet[each.key].id
  network_security_group_id = var.az_nsg_id
}

#----------------------------------------
# Create Subnet & Route Table Association
#----------------------------------------

resource "azurerm_subnet_route_table_association" "az_subnet_network_security_group_association" {
  for_each       = toset(split(",", var.az_subnet_cidr))
  subnet_id      = azurerm_subnet.az_subnet[each.key].id
  route_table_id = var.az_route_table_id
}
