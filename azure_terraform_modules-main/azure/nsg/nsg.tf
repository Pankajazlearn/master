#------------------------------------
# New Network Security Group Creation
#------------------------------------

resource "azurerm_network_security_group" "az_nsg" {
  name                = "nsg-${var.project}-${var.az_nsg_sequence}"
  resource_group_name = var.az_resource_group_name
  location            = var.location

  dynamic "security_rule" {
    for_each = toset(var.default_network_security_group_inbound)
    content {
      name                         = lookup(security_rule.value, "name", null)
      priority                     = lookup(security_rule.value, "priority", 1000)
      direction                    = lookup(security_rule.value, "direction", null)
      access                       = lookup(security_rule.value, "access", "Deny")
      protocol                     = lookup(security_rule.value, "protocol", "-1")
      source_port_range            = lookup(security_rule.value, "source_port_range", "*")
      source_port_ranges           = lookup(security_rule.value, "source_port_ranges", [])
      destination_port_range       = lookup(security_rule.value, "destination_port_range", "*")
      destination_port_ranges      = lookup(security_rule.value, "source_port_ranges", [])
      source_address_prefix        = lookup(security_rule.value, "source_address_prefix", "")
      source_address_prefixes      = lookup(security_rule.value, "source_address_prefixes", [])
      destination_address_prefix   = lookup(security_rule.value, "destination_address_prefix", "")
      destination_address_prefixes = lookup(security_rule.value, "destination_address_prefixes", [])
    }
  }

  dynamic "security_rule" {
    for_each = toset(var.default_network_security_group_outbound)
    content {
      name                         = lookup(security_rule.value, "name", null)
      priority                     = lookup(security_rule.value, "priority", 1000)
      direction                    = lookup(security_rule.value, "direction", null)
      access                       = lookup(security_rule.value, "access", "Deny")
      protocol                     = lookup(security_rule.value, "protocol", "-1")
      source_port_range            = lookup(security_rule.value, "source_port_range", "*")
      source_port_ranges           = lookup(security_rule.value, "source_port_ranges", [])
      destination_port_range       = lookup(security_rule.value, "destination_port_range", "*")
      destination_port_ranges      = lookup(security_rule.value, "source_port_ranges", [])
      source_address_prefix        = lookup(security_rule.value, "source_address_prefix", "")
      source_address_prefixes      = lookup(security_rule.value, "source_address_prefixes", [])
      destination_address_prefix   = lookup(security_rule.value, "destination_address_prefix", "")
      destination_address_prefixes = lookup(security_rule.value, "destination_address_prefixes", [])
    }
  }

  tags = merge(
    local.common_tags,
    {
      Name        = "nsg-${var.project}-${var.az_nsg_sequence}",
      Description = "Network Secuirty Group with ${length(var.default_network_security_group_inbound)} inbound rules and ${length(var.default_network_security_group_outbound)} outbound rules security rules."
    }
  )
}
