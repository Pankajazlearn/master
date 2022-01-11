<!-- BEGIN_TF_DOCS -->

# Azure SQL Virtual Machine

- Azure Virtual Network is used as a data source which is attached to the Virtual Machine

- Random Password is created and stored in Azure Key vault to apply it as a Virtual Machine Password

- Azure Network Interface card is created for the Virtual Machine

- Used Existing NSG module to create NSG rule for RDP and attached the NSG with Network Interface card with its association resource

- Azure Virtual Machine is created with delete_os_on_termination flag and boot_diagnostics block as optional

- Azure SQL Virtual Machine is created with key_vault_credential, auto_patching blocks with auto_backup block is developed as an optional feature

# Pre-requisites

- Azure Virtual Network

- Azure Storage Account

### `main.tf`
```hcl

provider "azurerm" {
  features {}
}

module "mssql_vm" {
  source              = "./mssql_vm/"
  az_resource_group_name = var.az_resource_group_name
  owner               = var.owner
  business_unit       = var.business_unit
  operational_company = var.operational_company
  client_secret       = var.client_secret
  az_service_principal_name = var.az_service_principal_name
  accelerated_networking    = var.accelerated_networking
  az_keyvault_name          = var.az_keyvault_name
  az_key_vault_url          = var.az_key_vault_url
  az_virtual_network_name   = var.az_virtual_network_name
  az_random_vmpassword_length  = var.az_random_vmpassword_length
  az_keyvault_secret_name   = var.az_keyvault_secret_name
  az_keyvault_id            = var.az_keyvault_id
  az_subnet_id              = var.az_subnet_id
  sequence_of_network_card  = var.sequence_of_network_card
  location-id               = var.location-id
  client                    = var.client
  device-role               = var.device-role
  form-factor               = var.form-factor
  sequence_of_virtual_machine = var.sequence_of_virtual_machine
  az_vmsize                 = var.az_vmsize
  delete_os_on_termination_flag = var.delete_os_on_termination_flag
  az_image_publisher        = var.az_image_publisher
  az_image_offer            = var.az_image_offer
  az_image_sku              = var.az_image_sku
  az_image_version          = var.az_image_version
  az_boot_diagnostics_flag  = var.az_boot_diagnostics_flag
  az_storage_account_uri    = var.az_storage_account_uri
  az_computer_name          = var.az_computer_name
  az_vm_username            = var.az_vm_username
  az_sql_license_type       = var.az_sql_license_type
  az_r_services_enabled_flag = var.az_r_services_enabled_flag
  az_sql_connectivity_port  = var.az_sql_connectivity_port
  az_sql_connectivity_type  = var.az_sql_connectivity_type
  az_sql_connectivity_update_password  = var.az_sql_connectivity_update_password
  az_sql_connectivity_update_username  = var.az_sql_connectivity_update_username
  az_patching_day_of_week   = var.az_patching_day_of_week
  az_patching_maintenance_duration_mins  = var.az_patching_maintenance_duration_mins
  az_patching_maintenance_starting_hour  = var.az_patching_maintenance_starting_hour
  az_encryption_enabled_flag             = var.az_encryption_enabled_flag
  az_encryption_password                 = var.az_encryption_password
  is_backup_enabled                      = var.is_backup_enabled
  az_retention_period                    = var.az_retention_period
  az_system_databases_backup_enabled_flag  = var.az_system_databases_backup_enabled_flag
  az_storage_blob_endpoint               = var.az_storage_blob_endpoint
  az_storage_account_access_key          = var.az_storage_account_access_key
  az_full_backup_frequency               = var.az_full_backup_frequency
  az_full_backup_start_hour              = var.az_full_backup_start_hour
  az_full_backup_window_in_hours         = var.az_full_backup_window_in_hours
  az_log_backup_frequency_in_minutes     = var.az_log_backup_frequency_in_minutes
  az_ip_configuration_name               = var.az_ip_configuration_name
  default_network_security_group_inbound = var.default_network_security_group_inbound
  default_network_security_group_outbound = var.default_network_security_group_outbound
  az_nsg_sequence            = var.az_nsg_sequence
  environment                = var.environment
  project                    = var.project
  location_abbreviation      = var.location_abbreviation
  location                   = var.location
}

```
## `variables.tf`
```

variable "owner" {
  type = string
  description = "Provide the owner in which the resources are provisioned"
}

variable "business_unit" {
  type = string
  description = "Provide the owner in which the resources are provisioned"
}

variable "operational_company" {
  type = string
  description = "Provide the owner in which the resources are provisioned"
}

variable "client_secret" {
  type = string
  description = "Provide the client secret for Key vault authentication"
}

variable "az_keyvault_name" {
  type    = string
  description = "Provide the name of the pre-existing Keyvault"
}

variable "az_key_vault_url" {
  type    = string
  description = "Provide the url of pre-existing Keyvault"
}

variable "az_service_principal_name" {
  type   = string
  description = "Provide the name of the service principal"
}

variable "create_vm" {
  type    = bool
  default = true
}

variable "az_resource_group_name" {
  type    = string
  description = "Provide the name of the resource group in which the resources are provisioned"
}

variable "location_abbreviation" {
  type    = string
  description = "Provide the abbreviation of location in which resources are provisioned"
}

variable "accelerated_networking" {
  type    = bool
  default = true
}

variable "project" {
  type    = string
}

variable "environment" {
  type    = string
}

variable "location" {
  type    = string
}

variable "az_virtual_network_name" {
  type    = string
  description = "The name of the virtual network which is used as a data source"
}

variable "az_random_vmpassword_length" {
  type    = number
  description = "The length of the random virtual machine password"
}

variable "az_keyvault_secret_name" {
  type    = string
  description = "The name of the keyvault secret that will be provisioned"
}

variable "az_keyvault_id" {
  type    = string
  description = "The ID of the keyvault which is used as a data source"
}

variable "az_subnet_id" {
  type    = string
  description = "The ID of the Subnet that needs to be attached for Network interface card"
}

variable "sequence_of_network_card" {
  type    = number
  description = "Resoure counter for Network interface card"
}

variable "location-id" {
  type    = string
  description = "The ID of the location in which resources are provisioned"
}

variable "client" {
  type    = string
  description = "The name of the client in which resources are provisioned"
}

variable "device-role" {
  type    = string
  description = "The name of the Device role in which resources are provisioned"
}

variable "form-factor" {
  type    = string
  description = "The name of the form-factor in which resources are provisioned"
}

variable "sequence_of_virtual_machine" {
  type    = number
  description = "Resoure counter for Virtual Machine"
}

variable "az_vmsize" {
  type    = string
  description = "The name of VM size in which resources are provisioned"
}

variable "delete_os_on_termination_flag" {
  type    = bool
  description = "Should the OS disk be deleted on termination flag"
}

variable "az_image_publisher" {
  type    = string
  description = "The name of the image publisher in which the resources are provisioned"
}

variable "az_image_offer" {
  type    = string
  description = "The name of the image offer in which the resources are provisioned"
}

variable "az_image_sku" {
  type    = string
  description = "The name of the image sku in which the resources are provisioned"
}

variable "az_image_version" {
  type    = string
  description = "The version of the image in which the resources are provisioned"
  default  = "latest"
}

variable "az_boot_diagnostics_flag" {
  type    = bool
  description = "Should the boot daignostics be enabled for virtual machine flag"
}

variable "az_storage_account_uri" {
  type    = string
  description = "The storage account uri for enabling the boot diagnostics for the virtual machine"
}

variable "az_computer_name" {
  type    = string
  description = "The name of the computer for the virtual machine"
}

variable "az_vm_username" {
  type    = string
  description = "The username for the virtual machine"
}

variable "az_sql_license_type" {
  type    = string
  description = "The SQL license type for the SQL virtual machine"
}

variable "az_r_services_enabled_flag" {
  type    = bool
  description = "Should R services be enabled flag for the SQL virtual machine"
}

variable "az_sql_connectivity_port" {
  type    = number
  description = "The SQL connectivity port for the SQL virtual machine"
}

variable "az_sql_connectivity_type" {
  type    = string
  description = "The SQL connectivity type for the SQL virtual machine"
}

variable "az_sql_connectivity_update_password" {
  type    = string
  description = "The SQL connectivity update password for the SQL virtual machine"
}

variable "az_sql_connectivity_update_username" {
  type    = string
  description = "The SQL connectivity update username for the SQL virtual machine"
}

variable "az_patching_day_of_week" {
  type    = string
  description = "The Patching day of week for the SQL virtual machine"
}

variable "az_patching_maintenance_duration_mins" {
  type    = number
  description = "The Patching maintenance duration in minutes for the SQL virtual machine"
}

variable "az_patching_maintenance_starting_hour" {
  type    = number
  description = "The Patching maintenance starting hour for the SQL virtual machine"
}

variable "az_encryption_enabled_flag" {
  type    = bool
  description = "Should the encryption for the backup be enabled flag"
}

variable "az_encryption_password" {
  type    = string
  description = "The password for the encryption of the backup"
}

variable "is_backup_enabled" {
  type    = bool
  description = "Optional flag for backup to be enabled"
}

variable "az_retention_period" {
  type    = string
  description = "The retention period for the backup for the SQL virtual machine"
}

variable "az_system_databases_backup_enabled_flag" {
  type    = bool
  description = "Should the system database backup enabled flag"
}

variable "az_storage_blob_endpoint" {
  type    = string
  description = "The storage blob endpoint for the storage account where backups will be kept"
}

variable "az_storage_account_access_key" {
  type    = string
  description = "The Access key for the storage account where backups will be kept"
}

variable "az_full_backup_frequency" {
  type    = string
  description = "The frequency of the full backups"
}

variable "az_full_backup_start_hour" {
  type    = string
  description = "Start hour of a given day during which full backups can take place"
}

variable "az_full_backup_window_in_hours" {
  type    = string
  description = "Duration of the time window of a given day during which full backups can take place, in hours. Valid values are between 1 and 23"
}

variable "az_log_backup_frequency_in_minutes" {
  type    = string
  description = "Frequency of log backups, in minutes. Valid values are from 5 to 60"
}

variable "az_ip_configuration_name" {
  type    = string
  description = "Name of the IP cofiguration required for Network interface card"
}

variable "default_network_security_group_inbound" {
  type   = list
  description = "Inbound Rule for RDP which is required for SQL VM"
}

variable "default_network_security_group_outbound" {
  type   = list
  description = "Outbound Rule which is required for SQL VM"
}

variable "az_nsg_sequence" {
  type = string
  description = "The suffix sequence for the NSG to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented."
}

```

## `variables.tfvars`

```

az_resource_group_name = "sql_vm_test"
location               = "uaenorth"
environment            = "dev"
project                = "project1"
owner                  = "example@maf.ae"
business_unit          = "SHARE"
operational_company    = "mafp"
az_dns_servers         = ["10.0.0.1", "10.0.0.2"]
az_route_table_name    = "routes"
az_service_principal_name = "xxxxxxxxx"
client_secret             = "xxxxxxxxxxxxxxxxxxxxxxxxxx"
accelerated_networking    = true
az_keyvault_name          = "azkeyxxxxxxxxxx"
az_key_vault_url          = "https://azkeyxxxxxxx.xxxxxxxx"
az_virtual_network_name   = "sql_vm_test-vnet"
az_random_vmpassword_length  = 15
az_keyvault_secret_name   = "vmpassword"
az_keyvault_id            = "/subscriptions/6xxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxx"
az_subnet_id              = "/subscriptions/6xxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxxxxx"
sequence_of_network_card  = 1
location-id               = "AZRDN"
client                    = "AA"
device-role               = "DB"
form-factor               = "MI"
sequence_of_virtual_machine = 1
az_vmsize                 = "Standard_DS14_v2"
delete_os_on_termination_flag = true
az_image_publisher        = "MicrosoftSQLServer"
az_image_offer            = "SQL2019-WS2019"
az_image_sku              = "Enterprise"
az_image_version          = "latest"
az_boot_diagnostics_flag  = true
az_storage_account_uri    = ""
az_computer_name          = "cloud"
az_vm_username            = "winxxxxxxx"
az_sql_license_type       = "PAYG"
az_r_services_enabled_flag = true
az_sql_connectivity_port  = 1433
az_sql_connectivity_type  = "PRIVATE"
az_sql_connectivity_update_password  = "RExxxxxxx@1xxxxxx"
az_sql_connectivity_update_username  = "clxxxxxxxxxxxxxx"
az_patching_day_of_week   = "Saturday"
az_patching_maintenance_duration_mins  = 60
az_patching_maintenance_starting_hour  = 2
az_encryption_enabled_flag             = true
az_encryption_password                 = "Huxxxxx@34xxxxxx"
is_backup_enabled                      = true
az_retention_period                    = 30
az_system_databases_backup_enabled_flag  = true
az_storage_blob_endpoint               = "https://stoxxxxxxxxxxxxxxxxxx"
az_storage_account_access_key          = "Lxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
az_full_backup_frequency               = "Daily"
az_full_backup_start_hour              = 21
az_full_backup_window_in_hours         = 21
az_log_backup_frequency_in_minutes     = 60
az_ip_configuration_name               = "Internal"
default_network_security_group_inbound = [
    {
      "name"                      : "Windows",
      "priority"                  : "100",
      "direction"                 : "Inbound",
      "access"                    : "Allow",
      "protocol"                  : "Tcp",
      "destination_port_ranges"   : [],
      "source_address_prefix"     : "3389",
      "destination_address_prefix": "*"
    }
]

default_network_security_group_outbound = []
az_nsg_sequence                         = "001"
location_abbreviation                   = "uaenorth"

```

## `outputs.tf`

```
#--------------------------------------------------------------
# Output of Azure Virtual Machine
#--------------------------------------------------------------

output "az_virtual_machine_id_output" {
  value  = azurerm_virtual_machine.az_virtual_machine.id
  description = "The output of Virtual Machine ID"
}

#--------------------------------------------------------------
# Output of Azure SQL Virtual Machine
#--------------------------------------------------------------

output "az_sql_virtual_machine_id_output" {
  value  = azurerm_mssql_virtual_machine.az_mssql_virtual_machine.id
  description = "The output of SQL Virtual Machine ID"
}
```

<!-- END_TF_DOCS -->
