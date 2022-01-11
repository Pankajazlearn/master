data "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
}

data "azurerm_resource_group" "vnet_rg" {
  name     = var.vnet_resource_group_name
}

data "azurerm_resource_group" "nic_rg" {
  name     = var.nic_resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.vnet_rg.name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.vnet_rg.name
}

# - 
# - Load Balancer
# -

resource "azurerm_lb" "lb" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.load_balancer_sku

  frontend_ip_configuration {
    name              = var.frontend_ip_configuration_name
    subnet_id         = data.azurerm_subnet.subnet.id
  }

  tags =  merge(
    local.common_tags,
    {
      Name        = "${var.load_balancer_name}"
      Description = "loadbalancer created for ${var.tag_Project}."
    }
  )
}

# -
# - Load Balancer backend adress pool
# -

resource "azurerm_lb_backend_address_pool" "lb_be_pool" {
  name                = var.load_balancer_backendpool_name
  loadbalancer_id     = azurerm_lb.lb.id
  depends_on          = [azurerm_lb.lb]
}

# -
# - Load Balancer health probe
# -

resource "azurerm_lb_probe" "lb_probe" {
  for_each            = var.load_balancer_rules
  name                = each.value["probe_name"]
  resource_group_name = var.resource_group_name
  loadbalancer_id     = azurerm_lb.lb.id
  port                = each.value["probe_port"]
  protocol            = lookup(each.value, "probe_protocol", null)
  request_path        = lookup(each.value, "probe_protocol", null) == "Tcp" ? null : lookup(each.value, "request_path", null)
  interval_in_seconds = lookup(each.value, "probe_interval", null)
  number_of_probes    = lookup(each.value, "probe_unhealthy_threshold", null)
  depends_on          = [azurerm_lb.lb]
}

# -
# - Load Balancer Rule
# -

resource "azurerm_lb_rule" "lb_rule" {
  for_each                       = var.load_balancer_rules
  name                           = each.value["name"]
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = coalesce(each.value["lb_protocol"], "Tcp")
  frontend_port                  = each.value["lb_port"]
  backend_port                   = each.value["backend_port"]
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  probe_id                       = lookup(azurerm_lb_probe.lb_probe, each.key, null) != null ? lookup(azurerm_lb_probe.lb_probe, each.key)["id"] : null
  load_distribution              = lookup(each.value, "load_distribution", null)
  idle_timeout_in_minutes        = lookup(each.value, "idle_timeout_in_minutes", null)
  enable_floating_ip             = coalesce(lookup(each.value, "enable_floating_ip"), false)
  disable_outbound_snat          = coalesce(lookup(each.value, "disable_outbound_snat"), false)
  enable_tcp_reset               = coalesce(lookup(each.value, "enable_tcp_reset"), false)
  depends_on                     = [azurerm_lb.lb, azurerm_lb_backend_address_pool.lb_be_pool, azurerm_lb_probe.lb_probe]
}

# -
# - Load Balancer outbound Rule
# -
resource "azurerm_lb_outbound_rule" "lb_outbound_rule" {
  for_each                 = var.lb_outbound_rules
  resource_group_name      = var.resource_group_name
  loadbalancer_id          = azurerm_lb.lb.id
  name                     = each.value["name"]
  protocol                 = each.value["protocol"]
  backend_address_pool_id  = azurerm_lb_backend_address_pool.lb_be_pool.id
  allocated_outbound_ports = lookup(each.value, "allocated_outbound_ports", null)

  dynamic "frontend_ip_configuration" {
    for_each = lookup(each.value, "frontend_ip_configuration_names", [])
    content {
      name = frontend_ip_configuration.value
    }
  }
  depends_on = [azurerm_lb.lb, azurerm_lb_backend_address_pool.lb_be_pool]
}

# -
# - Load Balancer NAT Rule
# -

resource "azurerm_lb_nat_rule" "lb_nat_rule" {
  for_each                       = local.load_balancer_nat_rules
  name                           = each.value.nat_rule["name"]
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = each.value.nat_rule["lb_port"]
  backend_port                   = each.value.nat_rule["backend_port"]
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  idle_timeout_in_minutes        = lookup(each.value.nat_rule, "idle_timeout_in_minutes", null)
  depends_on                     = [azurerm_lb.lb]
}

# -
# - Load Balancer NAT Pool
# -
resource "azurerm_lb_nat_pool" "lb_nat_pool" {
  for_each                       = var.load_balancer_nat_pools
  name                           = each.value["name"]
  resource_group_name            = var.resource_group_name
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port_start            = each.value["lb_port_start"]
  frontend_port_end              = each.value["lb_port_end"]
  backend_port                   = each.value["backend_port"]
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  depends_on                     = [azurerm_lb.lb]
} 

#-
#- network interface backend address pool association
#-

data "azurerm_network_interface" "nic" {
  for_each = var.network_interfaces
  name = each.value["name"]
  resource_group_name = var.nic_resource_group_name
}

resource "azurerm_network_interface_backend_address_pool_association" "bepool_association" {
  for_each                = var.network_interfaces
  network_interface_id    = each.value["network_interface_id"]
  ip_configuration_name   = each.value["ip_configuration_name"]
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_be_pool.id
}
