resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  count = local.enabled ? 1 : 0

  name               = var.diagnostic_setting_name
  target_resource_id = var.resource_id

  storage_account_id             = local.storage_id
  log_analytics_workspace_id     = local.log_analytics_id
  log_analytics_destination_type = local.log_analytics_destination_type
  eventhub_authorization_rule_id = local.eventhub_id

  dynamic "log" {
    for_each = var.log_categories
    content {
      category = log.value
      
      retention_policy {
        enabled = true
        days    = var.retention_days
      }
    }
  }

  dynamic "metric" {
    for_each = var.metric_categories
    content {
      category = metric.value
      
      retention_policy {
        enabled = true
        days    = var.retention_days      
      }
    }
  }

  lifecycle {
    ignore_changes = [log_analytics_destination_type]
  }
}
