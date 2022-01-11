# Azure CosmosDB SQLTable API
**Module Usage:** <br />
This module is used to create Cosmos  Core (SQL). To create a SQL(Core) API you need first to create the account with the right parameters. then use its name in sql_database module. This module creates a SQLdatabase and a container inside this database.

**Parameters:**

Parameter Name | Description | Type | Default |
--- | --- | --- | --- |
cosmosdb_sql_dbname |  Specifies the name of the Cosmos DB SQL Database.  | string  | no default - Follow convention "sqldb-\<database name\>-\<environment\>" |
resource_group_name | The name of the Resource Group where the Cosmos DB SQL Database is created.| string |  |
cosmosdb_account_name |  The name of the Cosmos DB SQL Database to create the table within.  | string |  | 
sql_db_throughput | The throughput of SQL database (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply. Do not set when azurerm_cosmosdb_account is configured with EnableServerless capability.  | number | |
db_autoscale_settings | The maximum throughput of the MongoDB collection (RU/s). Must be between 4,000 and 1,000,000. | map |  definition example: </n> db_autoscale_settings={settings={max_throughput = 4000}}| 
sql_db_container_name | Specifies the name of the Cosmos DB SQL Container. | string |  | 
partition_key_path | Define a partition key. Changing this forces a new resource to be created.| string|  | 
sql_container_throughput | The throughput of SQL container (RU/s). Must be set in increments of 100. The minimum value is 400.
| number |  | 
sql_db_default_ttl |The default time to live of SQL container. If missing, items are not expired automatically. If present and the value is set to -1, it is equal to infinity, and items don’t expire by default. If present and the value is set to some number n – items will expire n seconds after their last modified time.| number |  | 
container_unique_key | A list of paths to use for the unique key.| map |  |
container_autoscale_settings |  An autoscale_settings block as defined below. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply. Requires partition_key_path to be set. | map |  | 
container_indexing_policy | Specifies the index policy paramerers | map |  | 
**OPA Policies:** <br />
OPA policies are in iac-pac repository (https://github.com/GS-MAFTech/iac-pac)

**Validate OPA policies:** <br />
terraform plan -out plan1 <br />
terraform show -json plan1 > plan1.json <br />
opa eval  --format pretty  -d \<opa-folder\> --input plan1.json "data.terraform.deny" <br />
