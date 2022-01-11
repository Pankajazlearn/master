terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.59.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}

module "azurerm_lb" {
  source                   = "../"
  resource_group_name      = "test-sandy-rg"
  location                 = "westeurope"
  vnet_resource_group_name = "test-menna3"
  virtual_network_name     = "test-menna3-vnet"
  subnet_name              = "default"
  nic_resource_group_name  = "test-menna3"
  load_balancer_sku        = "Standard"

  load_balancer_name             = "lb-sharepoint-dev"

  frontend_ip_configuration_name = "lb-sharepoint-dev-frontendip-01"

  load_balancer_backendpool_name = "lb-sharepoint-dev-bepool-01"

  tag_Environment     = "dev"
  tag_Project         = "test"
  tag_Owner           = "Sandeep"
  tag_BusinessUnit    = "MAF"
  tag_Confidentiality = "Sensitive"
  tag_OpCo            = "test"

  load_balancer_rules = {
    loadbalancerrules1 = {
      name                      = "lb-sharepoint-dev-lbrule-01"
      probe_name                = "lb-sharepoint-dev-lbprobe-01"
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
      name                      = "lb-sharepoint-dev-lbrule-02"
      probe_name                = "lb-sharepoint-dev-lbprobe-02"
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
      name                    = "lb-sharepoint-dev-natrule-01"
      lb_keys                 = ["loadbalancer1"]
      frontend_ip_name        = "lb-sharepoint-dev-frontendip-01"
      lb_port                 = 443
      backend_port            = 22
      idle_timeout_in_minutes = 5
    }
  }

  network_interfaces = {
    networkinterface1 = {
      name                    = "lb-nic-001"
      network_interface_id    = "/subscriptions/646497f2-cf94-40d9-9ea0-0bb44fcce127/resourceGroups/test-menna3/providers/Microsoft.Network/networkInterfaces/lb-nic-001"
      ip_configuration_name   = "ipconfig1"
    }
    networkinterface2 = {
      name                    = "lb-nic-002"
      network_interface_id    = "/subscriptions/646497f2-cf94-40d9-9ea0-0bb44fcce127/resourceGroups/test-menna3/providers/Microsoft.Network/networkInterfaces/lb-nic-002"
      ip_configuration_name   = "ipconfig1"
    }
  }
}
