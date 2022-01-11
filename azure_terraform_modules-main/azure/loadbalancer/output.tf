#############################################################################
# OUTPUTS Load Balancer
#############################################################################

output "pri_lb_names" {
  value = azurerm_lb.lb.name
}

output "pri_lb_frontend_ip_configurations" {
  value = azurerm_lb.lb.frontend_ip_configuration
}

output "pri_lb_backend_ids" {
  value = azurerm_lb_backend_address_pool.lb_be_pool.id
}

output "pri_lb_rule_ids" {
  value = [for x in azurerm_lb_rule.lb_rule : x.id]
}

output "pri_lb_probe_ids" {
  value = [for x in azurerm_lb_probe.lb_probe : x.id]
}

output "pri_lb_probe_map_ids" {
  value = {
    for x in azurerm_lb_probe.lb_probe : x.name => x.id
  }
}

output "pri_lb_natrule_map_ids" {
  value = {
    for x in azurerm_lb_nat_rule.lb_nat_rule : x.name => x.id...
  }
}

output "pri_lb_natpool_map_ids" {
  value = {
    for x in azurerm_lb_nat_pool.lb_nat_pool : x.name => x.id
  }
}
