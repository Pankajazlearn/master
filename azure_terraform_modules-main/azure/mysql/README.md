# Create MySQL Server and MySQL Databases in Azure

This layer allows you to create and manage MySQL Server and one or many MySQL Databases in Microsoft Azure.

## Features

This layer will:

- Create MySQL Server in Microsoft Azure.
- Create one or many MySQL Databases with in the created MySQL Server.
- Set the MySQL Server configuration parameters.
- Create one or many MySQL Virtual Network Rules.
- Create one or many MySQL Firewall Rules.
- Allow/Deny Public Network Access to MySQL Server.
- Add MySQL Server Admin Login Password to Key Vault secrets.
- Enables AD authentication

## Security Controls

- Adheres to the [CIS Microsoft Azure Foundations Benchmark 1.3.0](https://docs.microsoft.com/en-us/azure/governance/policy/samples/cis-azure-1-3-0) for Database Services.

-	Control ID - 50096: Ensure that Advanced Data Security is enabled, and Advanced Threat Protection settings is configured properly for a SQL Database 
-	Control ID - 50102: Ensure that Advanced Threat Protection settings is configured properly for Azure Database for MySQL Server
-	Control ID - 50103: Ensure that "ssl_minimal_tls_version_enforced" is set to "1.2" for Azure Database for MySQL server 
-	Control ID - 50104: Ensure no MySQL Server allow ingress from Internet (ANY IP)
-	Control ID - 50105: Ensure that "geo_redundant_backup_enabled" is set to Enabled for Azure Database for MySQL server
-	Control ID - 50106: Ensure that Public Network Access is Disabled for Azure Database for MySQL server
-	Control ID - 50107: Ensure that Azure Database for MySQL server diagnostic setting is configured properly
-	Control ID - 50131: Ensure that Azure Active Directory authentication is configured for MySql server

## Usage

```
- name: mysql
  type: mysql
  version: "1.2.0"
  dependencies:
    keyvault: keyvault
    privateendpoints: privateendpoints
    Diagnostic logs: Eventhub
```

## Example

Please refer Example directory to consume this layer into your application.

- [var-mysql.auto.tfvars](./var-mysql.auto.tfvars) contains the variable defination or actual values for respective variables which are passed to the resource group module.

## Best practices for variable declaration/defination

- All names of the Resources should be defined as per standard naming conventions.

- While declaring variables with data type 'map(object)' or 'object; or 'list(object)', It's mandatory to define all the attributes in object. If you don't want to set any attribute then define its value as null or empty list([]) or empty map({}) as per the object data type.

- Please make sure all the Required parameters are set. Refer below section to understand the required and optional input values when using this module.

- Please verify that the values provided to the variables are in comfort with the allowed values for that variable. Refer below section to understand the allowed values for each variable when using this module.

## Inputs

### **Required Parameters**

These variables must be set in the `/Example/var-mysql.auto.tfvars` file when using this module.

#### key_vault_resource_group_name `string`

    Description: Specifies the name of the resource group where key vault is present.

#### storage_account_resource_group_name `string`

    Description: Specifies the name of the resource group where storage account is present.

#### resource_group_name `string`

    Description: Specifies the name of the resource group in which to create the MySQL Server.    

#### server_name `string`

    Description: Specifies the name of the MySQL Server. Changing this forces a new resource to be created. This needs to be globally unique within Azure.

#### database_names `map(object({}))`

    Description: Specifies the list of MySQL Database names. 

#### sku_name `string`

    Description: Specifies the SKU Name for this MySQL Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8).

    Default: "GP_Gen5_2"

#### mysql_version `string`

    Description:  Specifies the version of MySQL to use. Valid values are 5.6, 5.7, and 8.0. Changing this forces a new resource to be created.

    Default: "5.7"

#### storage_mb `number`

    Description: Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs.

    Default: 5120

#### private_endpoint_connection_enabled `bool`

    Description: Specify if only private endpoint connections will be allowed to access this resource.

    Default: true

### **Optional Parameters**

#### mysql_additional_tags `map(string)`

    Description: A mapping of tags to assign to the resource. Specifies additional MySQL Server resources tags, in addition to the resource group tags.

    Default: {
        pe_enable = true
    }

#### administrator_login_name `string`

    Description:  The Administrator Login for the MySQL Server.

    Default: "dbadmin"

#### administrator_login_password `string`

    Description: The Password associated with the administrator_login for the MySQL Server.

#### create_mode

    Description: Specifies the creation mode. Can be used to restore or replicate existing servers. Possible values are Default, Replica, GeoRestore, and PointInTimeRestore. Defaults to Default.

    Default: "Default"

#### creation_source_server_id

    Description: For creation modes other than Default, the source server ID to use.

#### restore_point_in_time

    Description: When create_mode is PointInTimeRestore, specifies the point in time to restore from `creation_source_server_id`.

#### backup_retention_days `number`

    Description: Backup retention days for the server, supported values are between 7 and 35 days.

    Default: 7

#### geo_redundant_backup_enabled `bool`

    Description: Turn Geo-redundant server backups on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers. When the backups are stored in geo-redundant backup storage, they are not only stored within the region in which your server is hosted, but are also replicated to a paired data center. This provides better protection and ability to restore your server in a different region in the event of a disaster. This is not supported for the Basic tier.

    Default: false

#### auto_grow_enabled `bool`

    Description: Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. If storage auto grow is enabled, the storage automatically grows without impacting the workload. The default value if not explicitly specified is true.

    Default: true

#### ssl_minimal_tls_version `string`

    Description: The minimum TLS version to support on the sever. Possible values are TLSEnforcementDisabled, TLS1_0, TLS1_1, and TLS1_2. Defaults to TLSEnforcementDisabled.

    Default: "TLSEnforcementDisabled"

#### infrastructure_encryption_enabled `bool`

    Description: Whether or not infrastructure is encrypted for this server. Defaults to false. Changing this forces a new resource to be created.

    Default: false

#### assign_identity `bool`

    Description: Specifies whether to enable Managed System Identity for the Azure SQL Server

    Default: true

#### mysql_configurations `map(any)`

    Description: Map of MySQL configuration settings to create. Key is name, value is server parameter value.

    Default: {}

#### firewall_rules `map(object({}))`

    Description: Specifies the Map of objects containing attributes for MySQL Server firewall Rules.

### Azure_AD_Authentication_User_Login_Name  `String`

    Description: A valid Azure AD user in the customer tenant to be Azure AD administrator.

### emails `list(string)`
  Description = (Required) List of email addresses that should recieve the security reports.
  
  Default     = []

### retention_days

  Description = (Optional) Specifies the retention in days for logs for this MySQL Server.
  
  Default     = 90

### enable_threat_detection_policy
  
  Description = Threat detection policy configuration for MySQL Server Security Alerts Policy
  
  Default     = true

### email_addresses_for_alerts `list(any)`
  
  Description = "A list of email addresses which alerts should be sent to."
  
  Default     = []

### "isabled_alerts `list(any)`
  
  Description = Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection,         Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action.
  
  Default     = []

### log_retention_days

  Description = Specifies the number of days to keep in the Threat Detection audit logs
  
  Default     = "30"

```hcl
Default: {
            "default" = {
                name             = "mysql-firewall-rule-default"
                start_ip_address = "0.0.0.0"
                end_ip_address   = "0.0.0.0"
            }
        }
```

| Attribute        | Data Type | Field Type | Description                                                                                                           | Allowed Values |
| :--------------- | :-------: | :--------: | :-------------------------------------------------------------------------------------------------------------------- | :------------- |
| name             |  string   |  Required  | Specifies the name of the MySQL Firewall Rule. Changing this forces a new resource to be created.                     |                |
| start_ip_address |  string   |  Required  | Specifies the Start IP Address associated with this Firewall Rule. Changing this forces a new resource to be created. |                |
| end_ip_address   |  string   |  Required  | Specifies the End IP Address associated with this Firewall Rule. Changing this forces a new resource to be created.   |                |

#### allowed_networks `list(object({}))`

    Description: Specifies the list of networks that the MySQL server will be connected to.

    default : []

| Attribute   | Data Type | Field Type | Description                                                 | Allowed Values |
| :---------- | :-------: | :--------: | :---------------------------------------------------------- | :------------- |
| subnet_name |  string   |  Required  | The Subnet Name that the MySQL server will be connected to. |                |
| vnet_name   |  string   |  Optional  | The VNet Name that the MySQL server will be connected to.   |                |

#### key_vault_name `string`

    Description: Specifies the existing Key Vault Name where you want to store MySql Server Password.

####  cmk_encryption_key_name `string`

    Description: keyvalult key name for the customer managed key encryption.

## Outputs

#### mysql_server_id

    Description: The server id of MySQL Server.

#### mysql_server_name

    Description: The server name of MySQL Server.

#### mysql_fqdn

    Description: The FQDN of MySQL Server.

#### admin_username

    Description: The administrator username of MySQL Server.

#### mysql_databases_names

    Description: List of all MySQL database resource names.

#### mysql_database_ids

    Description: The list of all MySQL database resource ids.

#### mysql_firewall_rule_ids

    Description: List of MySQL Firewall Rule resource ids.

#### mysql_vnet_rule_ids

    Description: The list of all MySQL VNet Rule resource ids.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Reference

[azurerm_mysql_server](https://www.terraform.io/docs/providers/azurerm/r/mysql_server.html) <br/>
[azurerm_mysql_database](https://www.terraform.io/docs/providers/azurerm/r/mysql_database.html) <br/>
[azurerm_mysql_virtual_network_rule](https://www.terraform.io/docs/providers/azurerm/r/mysql_virtual_network_rule.html) <br/>
[azurerm_mysql_firewall_rule](https://www.terraform.io/docs/providers/azurerm/r/mysql_firewall_rule.html) <br />
[azurerm_mysql_configuration](https://www.terraform.io/docs/providers/azurerm/r/mysql_configuration.html)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.59.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.87.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_access_policy.access_policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_key_vault_key.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_key_vault_secret.secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_mysql_active_directory_administrator.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_active_directory_administrator) | resource |
| [azurerm_mysql_configuration.mysql_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_configuration) | resource |
| [azurerm_mysql_database.mysql_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_database) | resource |
| [azurerm_mysql_firewall_rule.firewall_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_firewall_rule) | resource |
| [azurerm_mysql_server.mysql_server](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_server) | resource |
| [azurerm_mysql_server_key.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_server_key) | resource |
| [azurerm_mysql_virtual_network_rule.network_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_virtual_network_rule) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Azure_AD_Authentication_User_Login_Name"></a> [Azure\_AD\_Authentication\_User\_Login\_Name](#input\_Azure\_AD\_Authentication\_User\_Login\_Name) | A valid Azure AD user in the customer tenant to be Azure AD administrator | `string` | `""` | no |
| <a name="input_ackey"></a> [ackey](#input\_ackey) | Not required if MSI is used to authenticate to the SA where state file is | `any` | `null` | no |
| <a name="input_administrator_login_name"></a> [administrator\_login\_name](#input\_administrator\_login\_name) | The administrator username of MySQL Server | `string` | `""` | no |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | The administrator password of the MySQL Server | `string` | `null` | no |
| <a name="input_allowed_networks"></a> [allowed\_networks](#input\_allowed\_networks) | The List of networks that the MySQL server will be connected to. | <pre>list(object({<br>    subnet_id               = string<br>  }))</pre> | `[]` | no |
| <a name="input_assign_identity"></a> [assign\_identity](#input\_assign\_identity) | Specifies whether to enable Managed System Identity for the MySQL Server | `bool` | `true` | no |
| <a name="input_auto_grow_enabled"></a> [auto\_grow\_enabled](#input\_auto\_grow\_enabled) | Enable/Disable auto-growing of the storage. Storage auto-grow prevents your server from running out of storage and becoming read-only. If storage auto grow is enabled, the storage automatically grows without impacting the workload. The default value if not explicitly specified is true. | `bool` | `true` | no |
| <a name="input_backup_retention_days"></a> [backup\_retention\_days](#input\_backup\_retention\_days) | Backup retention days for the server, supported values are between 7 and 35 days. | `number` | `7` | no |
| <a name="input_cmk_encryption_key_name"></a> [cmk\_encryption\_key\_name](#input\_cmk\_encryption\_key\_name) | key vault key name for customer managed key encryption | `any` | `null` | no |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | The creation mode. Can be used to restore or replicate existing servers. Possible values are Default, Replica, GeoRestore, and PointInTimeRestore. Defaults to Default. | `string` | `"Default"` | no |
| <a name="input_creation_source_server_id"></a> [creation\_source\_server\_id](#input\_creation\_source\_server\_id) | For creation modes other than Default, the source server ID to use. | `string` | `null` | no |
| <a name="input_creation_source_server_name"></a> [creation\_source\_server\_name](#input\_creation\_source\_server\_name) | For creation modes other than Default, the source server Name to use. | `string` | `null` | no |
| <a name="input_database_names"></a> [database\_names](#input\_database\_names) | List of MySQL database names | <pre>map(object({<br>    name      = string<br>  }))</pre> | n/a | yes |
| <a name="input_disabled_alerts"></a> [disabled\_alerts](#input\_disabled\_alerts) | Specifies an array of alerts that are disabled. Allowed values are: Sql\_Injection, Sql\_Injection\_Vulnerability, Access\_Anomaly, Data\_Exfiltration, Unsafe\_Action. | `list(any)` | `[]` | no |
| <a name="input_email_addresses_for_alerts"></a> [email\_addresses\_for\_alerts](#input\_email\_addresses\_for\_alerts) | A list of email addresses which alerts should be sent to. | `list(any)` | `[]` | no |
| <a name="input_emails"></a> [emails](#input\_emails) | (Required) List of email addresses that should recieve the security reports. | `list(string)` | <pre>[<br>  "sandymassk@gmail.com",<br>  "sandeep.nagaraju-e@maf.ae"<br>]</pre> | no |
| <a name="input_enable_threat_detection_policy"></a> [enable\_threat\_detection\_policy](#input\_enable\_threat\_detection\_policy) | Threat detection policy configuration for MySQL Server Security Alerts Policy | `bool` | `true` | no |
| <a name="input_firewall_rules"></a> [firewall\_rules](#input\_firewall\_rules) | List of MySQL Server firewall rule specification | <pre>map(object({<br>    name             = string # (Required) Specifies the name of the MySQL Firewall Rule. <br>    start_ip_address = string # (Required) The starting IP Address to allow through the firewall for this rule<br>    end_ip_address   = string # (Required) The ending IP Address to allow through the firewall for this rule<br>  }))</pre> | <pre>{<br>  "default": {<br>    "end_ip_address": "0.0.0.0",<br>    "name": "mysql-firewall-rule-default",<br>    "start_ip_address": "0.0.0.0"<br>  }<br>}</pre> | no |
| <a name="input_geo_redundant_backup_enabled"></a> [geo\_redundant\_backup\_enabled](#input\_geo\_redundant\_backup\_enabled) | Turn Geo-redundant server backups on/off. This allows you to choose between locally redundant or geo-redundant backup storage in the General Purpose and Memory Optimized tiers. When the backups are stored in geo-redundant backup storage, they are not only stored within the region in which your server is hosted, but are also replicated to a paired data center. This provides better protection and ability to restore your server in a different region in the event of a disaster. This is not supported for the Basic tier. | `bool` | `true` | no |
| <a name="input_infrastructure_encryption_enabled"></a> [infrastructure\_encryption\_enabled](#input\_infrastructure\_encryption\_enabled) | Whether or not infrastructure is encrypted for this server. Defaults to false. Changing this forces a new resource to be created. | `bool` | `false` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Specifies the existing Key Vault Name where you want to store MySQL Server Password. | `string` | n/a | yes |
| <a name="input_log_retention_days"></a> [log\_retention\_days](#input\_log\_retention\_days) | Specifies the number of days to keep in the Threat Detection audit logs | `string` | `"30"` | no |
| <a name="input_mysql_additional_tags"></a> [mysql\_additional\_tags](#input\_mysql\_additional\_tags) | A mapping of tags to assign to the resource | `map(string)` | <pre>{<br>  "pe_enable": true<br>}</pre> | no |
| <a name="input_mysql_configurations"></a> [mysql\_configurations](#input\_mysql\_configurations) | Map of MySQL configuration settings to create. Key is name, value is server parameter value | `map(any)` | `{}` | no |
| <a name="input_mysql_version"></a> [mysql\_version](#input\_mysql\_version) | Specifies the version of MySQL to use. Valid values are 5.6, 5.7, and 8.0 | `string` | `"5.7"` | no |
| <a name="input_private_endpoint_connection_enabled"></a> [private\_endpoint\_connection\_enabled](#input\_private\_endpoint\_connection\_enabled) | Specify if only private endpoint connections will be allowed to access this resource | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the MySQL Server | `string` | n/a | yes |
| <a name="input_restore_point_in_time"></a> [restore\_point\_in\_time](#input\_restore\_point\_in\_time) | When create\_mode is PointInTimeRestore, specifies the point in time to restore from creation\_source\_server\_id. | `string` | `null` | no |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | (Optional) Specifies the retention in days for logs for this MySQL Server. | `number` | `90` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | The name of the MyQL Server | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for this MySQL Server | `string` | `"GP_Gen5_2"` | no |
| <a name="input_ssl_minimal_tls_version"></a> [ssl\_minimal\_tls\_version](#input\_ssl\_minimal\_tls\_version) | The minimum TLS version to support on the sever. Possible values are TLSEnforcementDisabled, TLS1\_0, TLS1\_1, and TLS1\_2. Defaults to TLSEnforcementDisabled. | `string` | `"TLSEnforcementDisabled"` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The name of the Storage account in which threat detection logs are saved | `string` | n/a | yes |
| <a name="input_storage_mb"></a> [storage\_mb](#input\_storage\_mb) | Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs. | `number` | `5120` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_username"></a> [admin\_username](#output\_admin\_username) | The administrator username of MySQL Server |
| <a name="output_mysql_database_ids"></a> [mysql\_database\_ids](#output\_mysql\_database\_ids) | The list of all MySQL database resource ids |
| <a name="output_mysql_databases_names"></a> [mysql\_databases\_names](#output\_mysql\_databases\_names) | List of all MySQL database resource names |
| <a name="output_mysql_firewall_rule_ids"></a> [mysql\_firewall\_rule\_ids](#output\_mysql\_firewall\_rule\_ids) | List of MySQL Firewall Rule resource ids |
| <a name="output_mysql_fqdn"></a> [mysql\_fqdn](#output\_mysql\_fqdn) | The FQDN of MySQL Server |
| <a name="output_mysql_server_id"></a> [mysql\_server\_id](#output\_mysql\_server\_id) | The server id of MySQL Server |
| <a name="output_mysql_server_id_map"></a> [mysql\_server\_id\_map](#output\_mysql\_server\_id\_map) | The server name to id map of MySQL Server |
| <a name="output_mysql_server_name"></a> [mysql\_server\_name](#output\_mysql\_server\_name) | The server name of MySQL Server |
| <a name="output_mysql_vnet_rule_ids"></a> [mysql\_vnet\_rule\_ids](#output\_mysql\_vnet\_rule\_ids) | The list of all MySQL VNet Rule resource ids |
| <a name="output_random_password"></a> [random\_password](#output\_random\_password) | The administrator username of MySQL Server |
