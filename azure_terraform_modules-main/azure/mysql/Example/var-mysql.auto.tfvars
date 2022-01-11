resource_group_name = "test-sandy-rg" # Resource Group name where mysql server is installed

storage_account_name = "azstorageacc01000" # Storage sccount name for threat_detection_policy logs

Azure_AD_Authentication_User_Login_Name = "adminuser" # AD Admin user name

key_vault_resource_group_name = "test-sandy-rg" # Resource Group name of key vault

storage_account_resource_group_name = "demo-iac-rg" # Resource Group name of storage account

#-#
#-# Azure MySQL Server Naming Convention : mysql-<appname>-<env>
#-# Eg: mysql-sharepoint-prod
#-#     mysql-webapp-prod
#-#
#-# MySQL Database Naming Convention : mysqldb-<appname>-<env>-<sequence>
#-# Eg: mysqldb-sharepoint-prod-01
#-#     mysqldb-sharepoint-prod-02
#-#
#-# Provide the tag value as per standards
#-# 

server_name         = "mysql-testapp-dev"

database_names                      = {
  db1 = {
    name = "mysqldb-testapp-dev-01"
  }
  db2 = {
    name = "mysqldb-testapp-dev-02"
  }
}
administrator_login_name            = "dbadmin"
administrator_login_password        = null
sku_name                            = "GP_Gen5_2"
mysql_version                       = "5.7"
create_mode                         = null
creation_source_server_id           = null
restore_point_in_time               = null
storage_mb                          = 5120
backup_retention_days               = 7
geo_redundant_backup_enabled        = false
auto_grow_enabled                   = true
private_endpoint_connection_enabled = true
ssl_minimal_tls_version             = "TLS1_2"
infrastructure_encryption_enabled   = true
key_vault_name                      = "keyvaultfordemo00012"
cmk_encryption_key_name             = null #"cmk_encryption" # set to null if you don't use CMK encryption

allowed_networks = [{
  subnet_id               = "/subscriptions/cb51da26-2a49-4183-a45c-06faefb92c4f/resourceGroups/rg-shared-westeurope-01/providers/Microsoft.Network/virtualNetworks/vnet-shared-hub-westeurope-001/subnets/snet-appgateway"
}]

firewall_rules = {
  "default" = {
    name             = "mysql-firewall-rule-default"
    start_ip_address = "0.0.0.0"
    end_ip_address   = "0.0.0.0"
  }
}

mysql_configurations = {
  interactive_timeout = "600"
}

email_addresses_for_alerts = ["sandeep.nagaraju-e@maf.ae"]

#-#
#-# Tags destails for Azure MySQL 
#-#

tag_Environment     = "dev"
tag_Project         = "test"
tag_Owner           = "Sandeep"
tag_BusinessUnit    = "MAF"
tag_Confidentiality = "Sensitive"
tag_OpCo            = "test"
