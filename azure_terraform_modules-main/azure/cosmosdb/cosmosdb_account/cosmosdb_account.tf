## Cosmos DB account
resource "azurerm_cosmosdb_account" "cosmos_account" {
  name                = var.cosmosdb_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard" # can only be standard 
  kind                = var.kind
  tags = merge(
    local.common_tags,
    {
      Name                = var.cosmosdb_account_name,
      Description         = "CosmosDB created for ${var.tag_Project}."
      Confidentiality     = var.tag_Confidentiality
      Data_classification = var.tag_Data_classification
    }
  )

  enable_free_tier                  = var.enable_free_tier
  ip_range_filter                   = var.ip_range_filter
  enable_multiple_write_locations   = var.enable_multiple_write_locations
  enable_automatic_failover         = var.enable_automatic_failover
  is_virtual_network_filter_enabled = var.is_virtual_network_filter_enabled
  default_identity_type             = var.default_identity_type
  public_network_access_enabled     = var.public_network_access_enabled
  analytical_storage_enabled        = try(var.analytical_storage_enabled, false)

  dynamic "analytical_storage" {
    for_each = var.analytical_storage != null && var.analytical_storage_enabled ? var.analytical_storage : toset([])
    content {
      schema_type = analytical_storage.value.schema_type

    }
  }
  dynamic "virtual_network_rule" {
    for_each = var.virtual_network_rule != null ? var.virtual_network_rule : {}
    content {
      id                                   = virtual_network_rule.value.id
      ignore_missing_vnet_service_endpoint = try(virtual_network_rule.value.ignore_missing_vnet_service_endpoint, false)

    }
  }
  dynamic "cors_rule" {
    for_each = var.cors_rule != null ? var.cors_rule : toset([])
    content {
      allowed_headers    = cors_rule.value.allowed_headers
      allowed_methods    = cors_rule.value.allowed_methods
      allowed_origins    = cors_rule.value.allowed_origins
      exposed_headers    = cors_rule.value.exposed_headers
      max_age_in_seconds = cors_rule.value.max_age_in_seconds

    }
  }
  dynamic "consistency_policy" {
    for_each = var.consistency_policies
    content {
      consistency_level       = consistency_policy.value.consistency_level
      max_interval_in_seconds = try(consistency_policy.value.max_interval_in_seconds, null)
      max_staleness_prefix    = try(consistency_policy.value.max_staleness_prefix, null)
    }
  }

  # Backup
  dynamic "backup" {
    for_each = var.backup != null ? var.backup : toset([])

    content {
      type                = backup.value.type
      interval_in_minutes = backup.value.interval_in_minutes
      retention_in_hours  = backup.value.retention_in_hours
      storage_redundancy  = backup.value.storage_redundancy
    }
  }
  # Primary location (Write Region)
  dynamic "geo_location" {
    for_each = var.geo_locations != null ? var.geo_locations : null

    content {
      location          = geo_location.value.location
      failover_priority = geo_location.value.failover_priority
      zone_redundant    = try(geo_location.value.zone_redundant, false)
    }
  }

  # Optional
  dynamic "capabilities" {
    for_each = try(toset(var.capabilities), [])

    content {
      name = capabilities.value
    }
  }
}


