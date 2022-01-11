data "azurerm_resource_group" "resource_group" {
  name  = var.resource_group_name
}

data "azurerm_resource_group" "key_vault_rg" {
  name  = var.key_vault_resource_group_name
}

data "azurerm_resource_group" "storage_account_rg" {
  name  = var.storage_account_resource_group_name
}

data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group_name
}

data "azurerm_storage_account" "storage_account" {
  name                = var.storage_account_name
  resource_group_name = var.storage_account_resource_group_name
}

# Generate random password
resource "random_password" "password" {
  length           = 32
  min_upper        = 2
  min_lower        = 2
  min_special      = 2
  number           = true
  special          = true
  override_special = "!@#$%&"
}

# -
# - Get the current user config
# -
data "azurerm_client_config" "current" {}

# -
# - MY SQL Server
# -
resource "azurerm_mysql_server" "mysql_server" {
  name                = var.server_name
  location            = data.azurerm_resource_group.resource_group.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  version             = var.mysql_version

  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  auto_grow_enabled            = var.auto_grow_enabled
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  create_mode                  = var.create_mode
  creation_source_server_id    = var.creation_source_server_id 
  restore_point_in_time        = var.restore_point_in_time

  administrator_login               = var.administrator_login_name
  administrator_login_password      = local.administrator_login_password
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled

  # - MY SQL Allow/Deny Public Network Access
  # - Only private endpoint connections will be allowed to access this resource if "private_endpoint_connection_enabled" variable is set to true

  public_network_access_enabled = var.private_endpoint_connection_enabled ? false : true
  
  dynamic "identity" {
    for_each = var.assign_identity == false ? [] : tolist([var.assign_identity])
    content {
      type = "SystemAssigned"
    }
  }

  # - Enables Threat detection policy
  
  dynamic "threat_detection_policy" {
    for_each = var.enable_threat_detection_policy == true ? [1] : []
    content {
      enabled                    = var.enable_threat_detection_policy
      disabled_alerts            = var.disabled_alerts
      email_account_admins       = var.email_addresses_for_alerts != null ? true : false
      email_addresses            = var.email_addresses_for_alerts
      retention_days             = var.log_retention_days
      storage_account_access_key = data.azurerm_storage_account.storage_account.primary_access_key
      storage_endpoint           = data.azurerm_storage_account.storage_account.primary_blob_endpoint
    }
  }

  lifecycle {
    ignore_changes = [administrator_login_password]
  }

  tags =  merge(
    local.common_tags,
    {
      Name        = "${var.server_name}"
      Description = "MySQL created for ${var.tag_Project}."
    }
  )
}

#-
#- Active directory authentication
#-
resource "azurerm_mysql_active_directory_administrator" "mysql_ad_admin" {
  server_name         = "${azurerm_mysql_server.mysql_server.name}"
  resource_group_name = azurerm_mysql_server.mysql_server.resource_group_name
  login               = var.Azure_AD_Authentication_User_Login_Name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = data.azurerm_client_config.current.object_id
  depends_on          = [azurerm_mysql_server.mysql_server]
}

# -
# - MY SQL Databases
# -
resource "azurerm_mysql_database" "mysql_db" {
  for_each            = var.database_names
  name                = each.value["name"]
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql_server.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
  depends_on          = [azurerm_mysql_server.mysql_server]
}

# -
# - MY SQL Configuration/Server Parameters
# -
resource "azurerm_mysql_configuration" "mysql_config" {
  for_each            = var.mysql_configurations
  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql_server.name
  value               = each.value
  depends_on          = [azurerm_mysql_server.mysql_server]
}

# -
# - MY SQL Virtual Network Rule
# - Enabled only if "private_endpoint_connection_enabled" variable is set to false
# - 
resource "azurerm_mysql_virtual_network_rule" "network_rule" {
  count               = var.private_endpoint_connection_enabled == false ? length(var.allowed_networks) : 0
  name                = "mysql-vnet-rule-${count.index + 1}"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql_server.name
  subnet_id           = var.allowed_networks[count.index].subnet_id #element(data.azurerm_subnet.this, count.index)["id"]
  depends_on          = [azurerm_mysql_server.mysql_server]
}

# -
# - MY SQL Firewall Rule
# - Enabled only if "private_endpoint_connection_enabled" variable is set to false
# - 
resource "azurerm_mysql_firewall_rule" "firewall_rule" {
  for_each            = var.private_endpoint_connection_enabled == false ? var.firewall_rules : {}
  name                = each.value.name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_server.mysql_server.name
  start_ip_address    = each.value.start_ip_address
  end_ip_address      = each.value.end_ip_address
  depends_on          = [azurerm_mysql_server.mysql_server]
}

# -
# - Create Key Vault Accesss Policy for MY SQL Server MSI
# -
resource "azurerm_key_vault_access_policy" "access_policy" {
  count        = (var.create_mode == "Default" && var.assign_identity == true) ? 1 : 0
  key_vault_id = data.azurerm_key_vault.key_vault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_mysql_server.mysql_server.identity.0.principal_id

  key_permissions         = local.key_permissions
  secret_permissions      = local.secret_permissions
  certificate_permissions = local.certificate_permissions
  storage_permissions     = local.storage_permissions

  depends_on = [azurerm_mysql_server.mysql_server]
}

# -
# - Add MY SQL Server Admin Login Password to Key Vault secrets
# - 
resource "azurerm_key_vault_secret" "secret" {
  name         = azurerm_mysql_server.mysql_server.name
  value        = local.administrator_login_password
  key_vault_id = data.azurerm_key_vault.key_vault.id
  depends_on   = [azurerm_mysql_server.mysql_server]
}

#
# Generate CMK Key for Encryption
#
resource "azurerm_key_vault_key" "vault_key" {
  count        = var.cmk_encryption_key_name != null ? 1 : 0
  name         = var.cmk_encryption_key_name
  key_vault_id = data.azurerm_key_vault.key_vault.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt", "encrypt", "sign",
    "unwrapKey", "verify", "wrapKey"
  ]
}

resource "azurerm_mysql_server_key" "mysql_server_key" {
  count        = var.cmk_encryption_key_name != null ? 1 : 0
  server_id        = azurerm_mysql_server.mysql_server.id
  key_vault_key_id = azurerm_key_vault_key.vault_key[count.index].id
}
