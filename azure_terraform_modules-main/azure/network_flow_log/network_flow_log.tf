#----------------------------------------------
# Network Watcher Creation - Default is "false"
#----------------------------------------------

resource "azurerm_network_watcher" "az_network_watcher" {
  count               = var.create_network_watcher ? 1 : 0
  name                = "NetworkWatcher_${var.location}"
  location            = var.location
  resource_group_name = "NetworkWatcherRG"

  tags = merge(
    local.common_tags,
    {
      Name        = "NetworkWatcher_${var.location}",
      Description = "A Network watcher in ${var.location}."
    }
  )
}

#-----------------------------------
# Network Watcher Flow Log creation 
#-----------------------------------

resource "azurerm_network_watcher_flow_log" "az_network_watcher_flow_log" {
  network_watcher_name      = "NetworkWatcher_${var.location}"
  resource_group_name       = "NetworkWatcherRG"
  network_security_group_id = var.az_nsg_id
  storage_account_id        = var.az_storage_account_data_id                                                 
  enabled                   = true

  retention_policy {
    enabled = var.is_network_watcher_flow_log_retention_policy_enabled
    days    = var.az_network_watcher_flow_log_retention_policy_days
  }

  depends_on = [
    azurerm_network_watcher.az_network_watcher
  ]

  tags = merge(
    local.common_tags,
    {
      Name        = "network-watcher-flow-log-${var.location_abbreviation}-${var.az_network_watcher_flow_log_sequence}",
      Description = "A Network Watcher Flow Log in the NetworkWatcher_${var.location}."
    }
  )
}
