locals {
  logs_destinations_ids = var.logs_destinations_ids == null ? [] : var.logs_destinations_ids
  enabled               = length(local.logs_destinations_ids) > 0

  storage_id       = coalescelist([for r in local.logs_destinations_ids : r if contains(split("/", lower(r)), "microsoft.storage")], [null])[0]
  log_analytics_id = coalescelist([for r in local.logs_destinations_ids : r if contains(split("/", lower(r)), "microsoft.operationalinsights")], [null])[0]
  eventhub_id      = coalescelist([for r in local.logs_destinations_ids : r if contains(split("/", lower(r)), "microsoft.eventhub")], [null])[0]

  log_analytics_destination_type = local.log_analytics_id != null ? var.log_analytics_destination_type : null
}
