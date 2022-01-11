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
  default = true
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
  default = true
}

variable "az_storage_account_uri" {
  type    = string
  description = "The storage account uri for enabling the boot diagnostics for the virtual machine"
  default  = ""
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
  default = false
}

variable "az_encryption_password" {
  type    = string
  description = "The password for the encryption of the backup"
}

variable "is_backup_enabled" {
  type    = bool
  description = "Optional flag for backup to be enabled"
  default = false
}

variable "az_retention_period" {
  type    = string
  description = "The retention period for the backup for the SQL virtual machine"
}

variable "az_system_databases_backup_enabled_flag" {
  type    = bool
  description = "Should the system database backup enabled flag"
  default = false
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

variable "sequence_of_mssql_virtual_machine" {
  type   = number
  description = "Resource counter"
  default = 1
}
