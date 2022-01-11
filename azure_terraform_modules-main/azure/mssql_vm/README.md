## Azure SQL Virtual Machine Module

- Azure Virtual Network is used as a data source which was attached to the Virtual Machine
- Random Password is created and stored in Azure Key vault to apply it as Virtual Machine Password
- Used Existing NSG module to create NSG rule for RDP and attached the NSG with Network Interface card with its association resource
- Azure Network Interface card is created for the Virtual Machine
- Azure Virtual Machine is created with `delete_os_on_termination` flag and `boot_diagnostics` block as optional
- Azure SQL Virtual Machine is created with `key_vault_credential`, `auto_patching` and `auto_backup` blocks with `auto_backup` is developed as optional flag

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.90.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nsg"></a> [nsg](#module\_nsg) | ../nsg/ | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_secret.az_keyvault_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |
| [azurerm_mssql_virtual_machine.az_mssql_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_virtual_machine) | resource |
| [azurerm_network_interface.az_network_interface_card](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.az_network_interface_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_virtual_machine.az_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |
| [random_password.az_random_vmpassword](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [azurerm_virtual_network.az_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accelerated_networking"></a> [accelerated\_networking](#input\_accelerated\_networking) | n/a | `bool` | `true` | no |
| <a name="input_az_boot_diagnostics_flag"></a> [az\_boot\_diagnostics\_flag](#input\_az\_boot\_diagnostics\_flag) | Should the boot daignostics be enabled for virtual machine flag | `bool` | n/a | yes |
| <a name="input_az_computer_name"></a> [az\_computer\_name](#input\_az\_computer\_name) | The name of the computer for the virtual machine | `string` | n/a | yes |
| <a name="input_az_encryption_enabled_flag"></a> [az\_encryption\_enabled\_flag](#input\_az\_encryption\_enabled\_flag) | Should the encryption for the backup be enabled flag | `bool` | n/a | yes |
| <a name="input_az_encryption_password"></a> [az\_encryption\_password](#input\_az\_encryption\_password) | The password for the encryption of the backup | `string` | n/a | yes |
| <a name="input_az_full_backup_frequency"></a> [az\_full\_backup\_frequency](#input\_az\_full\_backup\_frequency) | The frequency of the full backups | `string` | n/a | yes |
| <a name="input_az_full_backup_start_hour"></a> [az\_full\_backup\_start\_hour](#input\_az\_full\_backup\_start\_hour) | Start hour of a given day during which full backups can take place | `string` | n/a | yes |
| <a name="input_az_full_backup_window_in_hours"></a> [az\_full\_backup\_window\_in\_hours](#input\_az\_full\_backup\_window\_in\_hours) | Duration of the time window of a given day during which full backups can take place, in hours. Valid values are between 1 and 23 | `string` | n/a | yes |
| <a name="input_az_image_offer"></a> [az\_image\_offer](#input\_az\_image\_offer) | The name of the image offer in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_az_image_publisher"></a> [az\_image\_publisher](#input\_az\_image\_publisher) | The name of the image publisher in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_az_image_sku"></a> [az\_image\_sku](#input\_az\_image\_sku) | The name of the image sku in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_az_image_version"></a> [az\_image\_version](#input\_az\_image\_version) | The version of the image in which the resources are provisioned | `string` | `"latest"` | no |
| <a name="input_az_ip_configuration_name"></a> [az\_ip\_configuration\_name](#input\_az\_ip\_configuration\_name) | Name of the IP cofiguration required for Network interface card | `string` | n/a | yes |
| <a name="input_az_key_vault_url"></a> [az\_key\_vault\_url](#input\_az\_key\_vault\_url) | Provide the url of pre-existing Keyvault | `string` | n/a | yes |
| <a name="input_az_keyvault_id"></a> [az\_keyvault\_id](#input\_az\_keyvault\_id) | The ID of the keyvault which is used as a data source | `string` | n/a | yes |
| <a name="input_az_keyvault_name"></a> [az\_keyvault\_name](#input\_az\_keyvault\_name) | Provide the name of the pre-existing Keyvault | `string` | n/a | yes |
| <a name="input_az_keyvault_secret_name"></a> [az\_keyvault\_secret\_name](#input\_az\_keyvault\_secret\_name) | The name of the keyvault secret that will be provisioned | `string` | n/a | yes |
| <a name="input_az_log_backup_frequency_in_minutes"></a> [az\_log\_backup\_frequency\_in\_minutes](#input\_az\_log\_backup\_frequency\_in\_minutes) | Frequency of log backups, in minutes. Valid values are from 5 to 60 | `string` | n/a | yes |
| <a name="input_az_nsg_sequence"></a> [az\_nsg\_sequence](#input\_az\_nsg\_sequence) | The suffix sequence for the NSG to be provisioned. The sequence number should always be checked from the Azure portal and incremented/decremented. | `string` | n/a | yes |
| <a name="input_az_patching_day_of_week"></a> [az\_patching\_day\_of\_week](#input\_az\_patching\_day\_of\_week) | The Patching day of week for the SQL virtual machine | `string` | n/a | yes |
| <a name="input_az_patching_maintenance_duration_mins"></a> [az\_patching\_maintenance\_duration\_mins](#input\_az\_patching\_maintenance\_duration\_mins) | The Patching maintenance duration in minutes for the SQL virtual machine | `number` | n/a | yes |
| <a name="input_az_patching_maintenance_starting_hour"></a> [az\_patching\_maintenance\_starting\_hour](#input\_az\_patching\_maintenance\_starting\_hour) | The Patching maintenance starting hour for the SQL virtual machine | `number` | n/a | yes |
| <a name="input_az_r_services_enabled_flag"></a> [az\_r\_services\_enabled\_flag](#input\_az\_r\_services\_enabled\_flag) | Should R services be enabled flag for the SQL virtual machine | `bool` | n/a | yes |
| <a name="input_az_random_vmpassword_length"></a> [az\_random\_vmpassword\_length](#input\_az\_random\_vmpassword\_length) | The length of the random virtual machine password | `number` | n/a | yes |
| <a name="input_az_resource_group_name"></a> [az\_resource\_group\_name](#input\_az\_resource\_group\_name) | Provide the name of the resource group in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_az_retention_period"></a> [az\_retention\_period](#input\_az\_retention\_period) | The retention period for the backup for the SQL virtual machine | `string` | n/a | yes |
| <a name="input_az_service_principal_name"></a> [az\_service\_principal\_name](#input\_az\_service\_principal\_name) | Provide the name of the service principal | `string` | n/a | yes |
| <a name="input_az_sql_connectivity_port"></a> [az\_sql\_connectivity\_port](#input\_az\_sql\_connectivity\_port) | The SQL connectivity port for the SQL virtual machine | `number` | n/a | yes |
| <a name="input_az_sql_connectivity_type"></a> [az\_sql\_connectivity\_type](#input\_az\_sql\_connectivity\_type) | The SQL connectivity type for the SQL virtual machine | `string` | n/a | yes |
| <a name="input_az_sql_connectivity_update_password"></a> [az\_sql\_connectivity\_update\_password](#input\_az\_sql\_connectivity\_update\_password) | The SQL connectivity update password for the SQL virtual machine | `string` | n/a | yes |
| <a name="input_az_sql_connectivity_update_username"></a> [az\_sql\_connectivity\_update\_username](#input\_az\_sql\_connectivity\_update\_username) | The SQL connectivity update username for the SQL virtual machine | `string` | n/a | yes |
| <a name="input_az_sql_license_type"></a> [az\_sql\_license\_type](#input\_az\_sql\_license\_type) | The SQL license type for the SQL virtual machine | `string` | n/a | yes |
| <a name="input_az_storage_account_access_key"></a> [az\_storage\_account\_access\_key](#input\_az\_storage\_account\_access\_key) | The Access key for the storage account where backups will be kept | `string` | n/a | yes |
| <a name="input_az_storage_account_uri"></a> [az\_storage\_account\_uri](#input\_az\_storage\_account\_uri) | The storage account uri for enabling the boot diagnostics for the virtual machine | `string` | n/a | yes |
| <a name="input_az_storage_blob_endpoint"></a> [az\_storage\_blob\_endpoint](#input\_az\_storage\_blob\_endpoint) | The storage blob endpoint for the storage account where backups will be kept | `string` | n/a | yes |
| <a name="input_az_subnet_id"></a> [az\_subnet\_id](#input\_az\_subnet\_id) | The ID of the Subnet that needs to be attached for Network interface card | `string` | n/a | yes |
| <a name="input_az_system_databases_backup_enabled_flag"></a> [az\_system\_databases\_backup\_enabled\_flag](#input\_az\_system\_databases\_backup\_enabled\_flag) | Should the system database backup enabled flag | `bool` | n/a | yes |
| <a name="input_az_virtual_network_name"></a> [az\_virtual\_network\_name](#input\_az\_virtual\_network\_name) | The name of the virtual network which is used as a data source | `string` | n/a | yes |
| <a name="input_az_vm_username"></a> [az\_vm\_username](#input\_az\_vm\_username) | The username for the virtual machine | `string` | n/a | yes |
| <a name="input_az_vmsize"></a> [az\_vmsize](#input\_az\_vmsize) | The name of VM size in which resources are provisioned | `string` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | Provide the owner in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_client"></a> [client](#input\_client) | The name of the client in which resources are provisioned | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | Provide the client secret for Key vault authentication | `string` | n/a | yes |
| <a name="input_create_vm"></a> [create\_vm](#input\_create\_vm) | n/a | `bool` | `true` | no |
| <a name="input_default_network_security_group_inbound"></a> [default\_network\_security\_group\_inbound](#input\_default\_network\_security\_group\_inbound) | Inbound Rule for RDP which is required for SQL VM | `list` | n/a | yes |
| <a name="input_default_network_security_group_outbound"></a> [default\_network\_security\_group\_outbound](#input\_default\_network\_security\_group\_outbound) | Outbound Rule which is required for SQL VM | `list` | n/a | yes |
| <a name="input_delete_os_on_termination_flag"></a> [delete\_os\_on\_termination\_flag](#input\_delete\_os\_on\_termination\_flag) | Should the OS disk be deleted on termination flag | `bool` | n/a | yes |
| <a name="input_device-role"></a> [device-role](#input\_device-role) | The name of the Device role in which resources are provisioned | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | n/a | yes |
| <a name="input_form-factor"></a> [form-factor](#input\_form-factor) | The name of the form-factor in which resources are provisioned | `string` | n/a | yes |
| <a name="input_is_backup_enabled"></a> [is\_backup\_enabled](#input\_is\_backup\_enabled) | Optional flag for backup to be enabled | `bool` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_location-id"></a> [location-id](#input\_location-id) | The ID of the location in which resources are provisioned | `string` | n/a | yes |
| <a name="input_location_abbreviation"></a> [location\_abbreviation](#input\_location\_abbreviation) | Provide the abbreviation of location in which resources are provisioned | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | Provide the owner in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Provide the owner in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_sequence_of_network_card"></a> [sequence\_of\_network\_card](#input\_sequence\_of\_network\_card) | Resoure counter for Network interface card | `number` | n/a | yes |
| <a name="input_sequence_of_virtual_machine"></a> [sequence\_of\_virtual\_machine](#input\_sequence\_of\_virtual\_machine) | Resoure counter for Virtual Machine | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_az_sql_virtual_machine_id_output"></a> [az\_sql\_virtual\_machine\_id\_output](#output\_az\_sql\_virtual\_machine\_id\_output) | The output of SQL Virtual Machine ID |
| <a name="output_az_virtual_machine_id_output"></a> [az\_virtual\_machine\_id\_output](#output\_az\_virtual\_machine\_id\_output) | The output of Virtual Machine ID |
