data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "test-menna-vnet"
  resource_group_name  = "test-menna"
}

module "account" {
  source                = "../cosmosdb_account"
  cosmosdb_account_name = "testmenna1221321423424234242434234"
  enable_free_tier      = true
  kind                  = "MongoDB"
  ### tags configured on the account level. 
  resource_group_name     = "test-menna"
  tag_Environment         = "sandbox"
  tag_Project             = "POC"
  tag_Owner               = "menna.ammar@gmail.com"
  tag_BusinessUnit        = "AA"
  tag_OpCo                = "mafp"
  tag_Confidentiality     = "Internal"
  tag_Data_classification = "financial"

  public_network_access_enabled     = false
  capabilities                      = ["MongoDBv3.4", "EnableMongo", "EnableAggregationPipeline", "mongoEnableDocLevelTTL"]
  location                          = "UAE North"
  enable_multiple_write_locations   = false
  enable_automatic_failover         = true
  is_virtual_network_filter_enabled = true

  virtual_network_rule = {
    network1 = {
      id = data.azurerm_subnet.example.id ### a service endpoint needs to be configured for this subnet in the vnet.
    }
  }

  ## allow portal access https://docs.microsoft.com/en-us/azure/cosmos-db/how-to-configure-firewall#allow-requests-from-the-azure-portal
  ip_range_filter = "104.42.195.92,40.76.54.131,52.176.6.30,52.169.50.45,52.187.184.26,0.0.0.0"
  consistency_policies = {
    policy = {
      consistency_level       = "BoundedStaleness"
      max_interval_in_seconds = 10
      max_staleness_prefix    = 200
    }

  }

  geo_locations = {
    geo_location = {
      location          = "UAE North"
      failover_priority = 0
    }

  }


}

resource "azurerm_log_analytics_workspace" "example" {
  name                = "acctest-01"
  location            = "UAE North"
  resource_group_name = "test-menna"
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  name                       = "example"
  target_resource_id         = module.account.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

  log {
    category = "DataPlaneRequests"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "example2" {
  name                       = "example2"
  target_resource_id         = module.account_sqlDB.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

  log {
    category = "DataPlaneRequests"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}

module "mongo_collection" {
  source          = "../cosmosdb_mongo"
  collection_name = "test_collection"
  database_name   = "test_database"
  shard_key       = "_id"
  collection_index = {
    index = {
      keys   = ["_id"],
      unique = true
    }
  }
  default_ttl_seconds   = 30
  resource_group_name   = "test-menna"
  cosmosdb_account_name = module.account.name
  # collection_autoscale_settings = {
  #  settings= {
  #     max_throughput = 5000
  #  }

  # }

}
