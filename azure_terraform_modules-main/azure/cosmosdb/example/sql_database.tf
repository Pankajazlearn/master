module "account_sqlDB" {
  source                = "../cosmosdb_account"
  cosmosdb_account_name = "testmenna122132142342423424243423456"
  enable_free_tier      = false
  kind                  = "GlobalDocumentDB"

  resource_group_name     = "test-menna"
  tag_Environment         = "sandbox"
  tag_Project             = "POC"
  tag_Owner               = "menna.ammar@gmail.com"
  tag_BusinessUnit        = "AA"
  tag_OpCo                = "mafp"
  tag_Confidentiality     = "Internal"
  tag_Data_classification = "financial"

  public_network_access_enabled     = false
  location                          = "UAE North"
  enable_multiple_write_locations   = false
  enable_automatic_failover         = true
  is_virtual_network_filter_enabled = false
  consistency_policies = {
    policy = {
      consistency_level = "Session"

    }

  }

  geo_locations = {
    geo_location = {
      location          = "UAE North"
      failover_priority = 0
    }

  }


}

module "db_sql" {
  source                = "../sql_database"
  sql_db_container_name = "test_container"
  cosmosdb_sql_dbname   = "test_db"
  resource_group_name   = "test-menna"
  location              = "UAE North"
  cosmosdb_account_name = module.account_sqlDB.name
  partition_key_path    = "/CollId"

}

