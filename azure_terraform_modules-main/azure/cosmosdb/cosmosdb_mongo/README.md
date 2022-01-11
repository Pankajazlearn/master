# Azure CosmosDB MongoDB API
**Module Usage:** <br />
This module is used to create Cosmos Mongo DB. To create a MongoDB API you need first to create the account with the right parameters. then use its name in MongoDB module. This module creates a MongoDB and a collection.

**Parameters:**

Parameter Name | Description | Type | Default |
--- | --- | --- | --- |
database_name | The name of this Cosmos DB Mongo Database. | string  | no default - Follow convention "mongodb-\<database name\>-\<environment\>" |
resource_group_name | The name of the Resource Group where the Cosmos DB Mongo Database is created.| string |  |
cosmosdb_account_name | The name of the Cosmos DB Account where the Mongo Database to create the table within. | string |  | 
db_throughput | The throughput of the MongoDB database (RU/s). Must be set in increments of 100. The minimum value is 400.  | number | |
db_autoscale_settings | The maximum throughput of the MongoDB database (RU/s). Must be between 4,000 and 1,000,000| map |  definition example: </n> db_autoscale_settings={settings={max_throughput = 4000}}| 
collection_name | Specifies the name of the Cosmos DB Mongo Collection.| string |  | 
shard_key | The name of the key to partition on for sharding. There must not be any other unique index keys.| string|  | 
default_ttl_seconds | The default Time To Live in seconds. If the value is -1 or 0, items are not automatically expired.
| number |  | 
collection_throughput |The throughput of the MongoDB collection (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.| number |  | 
collection_autoscale_settings | This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply. Requires shard_key to be set. | map(string) |  |
collection_index | Specifies the list of user settable keys for each Cosmos DB Mongo Collection. | map(string) |  | 

**OPA Policies:** <br />
OPA policies are in iac-pac repository (https://github.com/GS-MAFTech/iac-pac)

**Validate OPA policies:** <br />
terraform plan -out plan1 <br />
terraform show -json plan1 > plan1.json <br />
opa eval  --format pretty  -d \<opa-folder\> --input plan1.json "data.terraform.deny" <br />
