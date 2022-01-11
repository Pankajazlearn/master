#- Resource Group name where Load-balancer to be installed
resource_group_name      = "[__resource_group_name __]" 

location                 = "[__location__]"

vnet_resource_group_name = "[__vnet_resource_group_name__]" 

virtual_network_name     = "[__virtual_network_name__]"

subnet_name              = "[__subnet_name__]"

load_balancer_sku        = "Standard"

nic_resource_group_name  = "[__nic_resource_group_name__]"

#-#
#-# Azure Load-balancer Naming Convention : lb-<appname>-<env>
#-# Eg: lb-sharepoint-prod
#-#     lb-webapp-prod
#-#
#-# Load-balancer frontend IP Naming Convention : "<lbname>-frontendip-<instance>"
#-# Eg: lb-sharepoint-prod-frontendip-01
#-#
#-# Load-balancer backend pool Naming Convention : "<lbname>-bepool-<instance>"
#-# Eg: lb-sharepoint-prod-bepool-01
#-#
#-# Load-balancer lb rule Naming Convention : "<lbname>-lbrule-<instance>"
#-# Eg: lb-sharepoint-prod-lbrule-01
#-#     lb-sharepoint-prod-lbrule-02
#-#
#-# Load-balancer lb nat rule Naming Convention : "<lbname>-natrule-<instance>"
#-# Eg: lb-sharepoint-prod-natrule-01
#-#     lb-sharepoint-prod-natrule-02
#-#
#-# Load-balancer lb probe Naming Convention : "<lbname>-lbprobe-<instance>"
#-# Eg: lb-sharepoint-prod-lbprobe-01
#-#     lb-sharepoint-prod-lbprobe-02
#-#
#-# Provide the tag value as per standards
#-# 

load_balancer_name             = "[__load_balancer_name__]"

frontend_ip_configuration_name = "[__frontend_ip_configuration_name__]"

load_balancer_backendpool_name = "[__load_balancer_backendpool_name__]"

load_balancer_rules = {
  loadbalancerrules1 = {
    name                      = "[__load_balancer_rule_name__]"
    probe_name                = "[__load_balancer_probe_name__]"
    lb_key                    = "loadbalancer1"
    lb_protocol               = null
    lb_port                   = "22"
    probe_port                = "22"
    backend_port              = "22"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  }
  loadbalancerrules2 = {
    name                      = "[__load_balancer_rule_name__]"
    probe_name                = "[__load_balancer_probe_name__]"
    lb_key                    = "loadbalancer2"
    lb_protocol               = null
    lb_port                   = "80"
    probe_port                = "80"
    backend_port              = "80"
    enable_floating_ip        = null
    disable_outbound_snat     = null
    enable_tcp_reset          = null
    probe_protocol            = "Tcp"
    request_path              = "/"
    probe_interval            = 15
    probe_unhealthy_threshold = 2
    load_distribution         = "SourceIPProtocol"
    idle_timeout_in_minutes   = 5
  }
}

load_balancer_nat_pools = {}

lb_outbound_rules = {}

load_balancer_nat_rules = {
  loadbalancernatrules1 = {
    name                    = "[__load_balancer_natrule_name__]"
    lb_keys                 = ["loadbalancer1"]
    frontend_ip_name        = "[__load_balancer_frontend_ip_name__]"
    lb_port                 = 443
    backend_port            = 22
    idle_timeout_in_minutes = 5
  }
}

#-#
#-# Tags destails for Azure Load balancer 
#-#

tag_Environment     = ""
tag_Project         = ""
tag_Owner           = ""
tag_BusinessUnit    = ""
tag_Confidentiality = ""
tag_OpCo            = ""

#-#
#-# Network interface details for load balancer backend address pool association 
#-#

network_interfaces = {
  networkinterface1 = {
    name                    = "[__network_interface_name__]"
    network_interface_id    = "/subscriptions/[__subscription_id__]/resourceGroups/[__VM/NIC_resource_group_name__]/providers/Microsoft.Network/networkInterfaces/[__network_interface_name__]"
    ip_configuration_name   = "[__ip_configuration_name__]"
  }
  networkinterface2 = {
    name                    = "lb-nic-002"
    network_interface_id    = "/subscriptions/[__subscription_id__]/resourceGroups/[__VM/NIC_resource_group_name__]/providers/Microsoft.Network/networkInterfaces/[__network_interface_name__]"
    ip_configuration_name   = "[__ip_configuration_name__]"
  }
}
