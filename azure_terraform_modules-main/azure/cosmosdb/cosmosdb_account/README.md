# Azure CosmosDB 
**Module Usage:** <br />
This module is used to create Cosmos DB Account

**Parameters:**

Parameter Name | Description | Type | Default |
--- | --- | --- | --- |
name | This is the human-readable name of the cosmos db account. | string  | no default - Follow convention "cosmos-\<app name\>-\<environment\>" |
location | Specifies the supported Azure location where the resource exists | string |  |
resource_group_name | The name of the resource group where to create the resource. | string |  | 
kind | Specifies the Kind of CosmosDB to create | string | GlobalDocumentDB Or MongoDB |
tags | A mapping of tags to assign to the resource. | map | Name and Description tags are put as default | 
enable_free_tier | Enable Free Tier pricing option for this Cosmos DB account.| boolean |  | 
ip_range_filter | CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account.| string (Comma seprated IP addresses) |  | 
enable_multiple_write_locations | Enable multiple write locations for this Cosmos DB account.| bool | false | 
enable_automatic_failover |Enable automatic fail over for this Cosmos DB account.| bool | false | 
is_virtual_network_filter_enabled | Enables virtual network filtering for this Cosmos DB account. | bool | false |
default_identity_type | The default identity for accessing Key Vault. | string | FirstPartyIdentity | 
public_network_access_enabled | Whether or not public network access is allowed for this CosmosDB account. | bool | false | 
deduplication_scope | Specifies whether message deduplication occurs at the message group or queue level | string | null | 
analytical_storage_enabled |  Enable Analytical Storage option for this Cosmos DB account.| bool | false | 
analytical_storage | block that defines analytical storage | map(string)| definition example: </n> analytical_storage={settings={schema_type = "FullFidelity"}} |
virtual_network_rule|  Specifies a virtual_network_rules resource, used to define which subnets are allowed to access this CosmosDB account.| map(string) |definition example: </n> virtual_network_rule={rule1={id = \<subnet_id\>, ignore_missing_vnet_service_endpoint=false}}|
cors_rule| A cors_rule block | map(string) | |
consistency_policy |  Configures the database consistency | map(string)| |
backup| configures backup for the account | map(string) ||
geo_location | Specifies a geo_location resource, used to define where data should be replicated with the failover_priority 0 specifying the primary location. | map(string) ||
capabilities | The capabilities which should be enabled for this Cosmos DB account.|map(string) ||


**OPA Policies:** <br />
OPA policies are in iac-pac repository (https://github.com/GS-MAFTech/iac-pac)

**Validate OPA policies:** <br />
terraform plan -out plan1 <br />
terraform show -json plan1 > plan1.json <br />
opa eval  --format pretty  -d \<opa-folder\> --input plan1.json "data.terraform.deny" <br />

**OPA validation scripts:** <br />
- enforce_automatic_failover.rego: checks automatic failover is enabled.
- enforce_diagnostic_settings.rego: Makes sure that the diagnostics settings are enabled for all cosmosdb accounts.
- enforce_required_tags.rego: Makes sure that the required tags are in place.
- enfore_private_network.rego: Makes sure that public access is not enabled & 0.0.0.0 is not enabled in ip_range_filter
