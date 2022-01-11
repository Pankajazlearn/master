variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which to create the Load Balancer"
}

variable "location" {
  type        = string
  description = "Location details in which to create the Load Balancer"
}

variable "vnet_resource_group_name" {
  type        = string
  description = "The name of the Virtual Network Resource Group"
}

variable "nic_resource_group_name" {
  type        = string
  description = "The name of the Network Interface Resource Group"
}

variable "virtual_network_name" {
  type        = string
  description = "The name of the virtual network"
}

variable "subnet_name" {
  type        = string
  description = "The name of the subnet to use in azure load balancer"
}

variable "load_balancer_name" {
  type        = string
  description = "Containing load balancer name"
}

variable "load_balancer_sku" {
  type        = string
  description = "load balancer sku"
}

variable "frontend_ip_configuration_name" {
  type        = string
  description = "Containing load balancer frontend IP name"
}


variable "load_balancer_backendpool_name" {
  type        = string
  description = "Containing load balancer backendpool"
}

variable "load_balancer_rules" {
  type = map(object({
    name                      = string
    probe_name                = string
    lb_key                    = string
    #frontend_ip_name          = string
    #backend_pool_name         = string
    lb_protocol               = string
    lb_port                   = string
    backend_port              = number
    enable_floating_ip        = bool
    disable_outbound_snat     = bool
    enable_tcp_reset          = bool
    probe_port                = number
    probe_protocol            = string
    request_path              = string
    probe_interval            = number
    probe_unhealthy_threshold = number
    load_distribution         = string
    idle_timeout_in_minutes   = number
  }))
  description = "Map containing load balancer rule and probe parameters"
  default     = {}
}

variable "load_balancer_nat_pools" {
  type = map(object({
    name             = string
    lb_key           = string
    frontend_ip_name = string
    lb_port_start    = number
    lb_port_end      = number
    backend_port     = number
  }))
  description = "Map containing load balancer nat pool parameters"
  default     = {}
}

variable "lb_outbound_rules" {
  type = map(object({
    name                            = string
    lb_key                          = string
    protocol                        = string
    backend_pool_name               = string
    allocated_outbound_ports        = number
    frontend_ip_configuration_names = list(string)

  }))
  description = "Map containing outbound nat rule parameters"
  default     = {}
}

variable "load_balancer_nat_rules" {
  type = map(object({
    name                    = string
    lb_keys                 = list(string)
    frontend_ip_name        = string
    lb_port                 = number
    backend_port            = number
    idle_timeout_in_minutes = number
  }))
  description = "Map containing load balancer nat rule parameters"
  default     = {}
}

variable "emptylist" {
  type    = list(string)
  default = ["null", "null"]
}

variable "network_interfaces" {
  type = map(object({
    name                    = string
    network_interface_id    = string
    ip_configuration_name   = string
  }))
  description = "Map containing network interface parameters"
  default     = {}
}

variable "tag_Environment" {
  type        = string
  description = "Loadbalancer tag Environment"
}

variable "tag_Project" {
  type        = string
  description = "Loadbalancer tag Project"
}

variable "tag_Owner" {
  type        = string
  description = "Loadbalancer tag Owner"
}

variable "tag_BusinessUnit" {
  type        = string
  description = "Loadbalancer tag BusinessUnit"
}

variable "tag_OpCo" {
  type        = string
  description = "Loadbalancer tag OpCo"
}

variable "tag_Confidentiality" {
  type        = string
  description = "Loadbalancer tag confidentiality"
}
  