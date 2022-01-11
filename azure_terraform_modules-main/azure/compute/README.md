## Azure Linux virtual Machine Module
- The compute terraform module is designed to deploy azure Linux virtual machines, with Image must be pre-existed in the account. Virtual machine is created with boot diagnostics and vm availability sets as an additional features, which are variablized. Os-disk and data-disk on instance termination flag is added and variablized.
- The password for the virtual machine is stored in azure key vault as secret, which must pre-existed with Terraform having read access for secret.
- Os-disk and data-disk are Server-side encrypted(SSE) with Platform managed keys(PMK). Count agrument is defined for managed disk to create 'n' number of managed disks and attach it to virtual machine as per requirement.
## Pre-requisites for using compute module
- Resource group must pre-exist
- Storage account must pre-exist in same resource group and region
- Image must pre-exist in same resource group and region
- Keyvault and secret must pre-exist with terraform having read access for secret must in same resource group and region
- DDoS protection plan must not pre-exist in the resource group, if present delete it
## Resources
| Name | Type |
|------|------|
| [azurerm_availability_set.az_availability_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set) | resource |
| [azurerm_managed_disk.az_managed_disk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.az_network_interface_card](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.az_network_interface_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_virtual_machine.az_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |
| [azurerm_virtual_machine_data_disk_attachment.az_data_disk_attachment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_availability_set.az_availability_set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/availability_set) | data source |
| [azurerm_image.az_packer_image](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/image) | data source |
| [azurerm_key_vault.az_key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.az_vm_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_storage_account.az_storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accelerated_networking"></a> [accelerated\_networking](#input\_accelerated\_networking) | Accelerated networking feature to be enabled or not for virtual machine | `bool` | `""` | no |
| <a name="input_az_availability_set_name"></a> [az\_availability\_set\_name](#input\_az\_availability\_set\_name) | Provide the name of existing availability set | `string` | `""` | no |
| <a name="input_az_image_name"></a> [az\_image\_name](#input\_az\_image\_name) | The name of the custom image for creating virtual machine | `string` | `""` | no |
| <a name="input_az_nsg_id"></a> [az\_nsg\_id](#input\_az\_nsg\_id) | Provide Network security group ID to which Network interface card is attached | `string` | `""` | no |
| <a name="input_az_vnet_subnet_id"></a> [az\_vnet\_subnet\_id](#input\_az\_vnet\_subnet\_id) | Subnet id of which the Network Interface card to be attached | `any` | n/a | yes |
| <a name="input_az_vnet_subnet_name"></a> [az\_vnet\_subnet\_name](#input\_az\_vnet\_subnet\_name) | Provide subnet name of virtual network | `string` | `""` | no |
| <a name="input_boot_diagnostics"></a> [boot\_diagnostics](#input\_boot\_diagnostics) | Boot diagnostic feature to be enabled or not for virtual machine | `bool` | `""` | no |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | `""` | no |
| <a name="input_client"></a> [client](#input\_client) | Provide the client Name of the Organization | `string` | `""` | no |
| <a name="input_create_availability_set"></a> [create\_availability\_set](#input\_create\_availability\_set) | Flag whether to create the availability set or not | `bool` | `""` | no |
| <a name="input_data_disk_termination"></a> [data\_disk\_termination](#input\_data\_disk\_termination) | Preserve volume of data disk on instance termination | `bool` | `""` | no |
| <a name="input_device-role"></a> [device-role](#input\_device-role) | Provide the device role code of the resources | `string` | `""` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Provide the environment name under the resources are provisioned | `string` | `""` | no |
| <a name="input_fault_domain_count"></a> [fault\_domain\_count](#input\_fault\_domain\_count) | Provide the fault domain count | `number` | `2` | no |
| <a name="input_form-factor"></a> [form-factor](#input\_form-factor) | Provide the form factor code of the resources i-e V for Virtual or P for Physical | `string` | `""` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | Provide the key vault name present in the infrastructure with service principal's read access of key vault | `string` | `""` | no |
| <a name="input_key_vault_secret"></a> [key\_vault\_secret](#input\_key\_vault\_secret) | Provide the name of key vault secret | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | Location where the resources are provisioned | `string` | `""` | no |
| <a name="input_location-id"></a> [location-id](#input\_location-id) | Provide the location ID of Virtual/Physical Location | `string` | `""` | no |
| <a name="input_managed_disk_size"></a> [managed\_disk\_size](#input\_managed\_disk\_size) | Provide the size of the managed disk required | `number` | `10` | no |
| <a name="input_number_of_disks"></a> [number\_of\_disks](#input\_number\_of\_disks) | Provide the number of managed disks required | `number` | `2` | no |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | Provide the Operational Company name under the resources are provisioned | `string` | `""` | no |
| <a name="input_os_disk_termination"></a> [os\_disk\_termination](#input\_os\_disk\_termination) | Preserve volume of os disk on instance termination | `bool` | `""` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The ownerin which the resources are provisioned | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The environment where the infrastructure should be provisioned | `string` | `""` | no |
| <a name="input_project"></a> [project](#input\_project) | Provide the project name code of the Business Unit under which the resources are provisioned | `string` | `""` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group in which the resources are provisioned | `string` | `""` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Provide the name of the storage account existing in the account | `string` | `""` | no |
| <a name="input_storage_account_uri"></a> [storage\_account\_uri](#input\_storage\_account\_uri) | Provide the Storage account's blob endpoint | `string` | `""` | no |
| <a name="input_username"></a> [username](#input\_username) | The username of the virtual machine | `string` | `""` | no |
| <a name="input_vm_availability_set"></a> [vm\_availability\_set](#input\_vm\_availability\_set) | VM availability set feature to be enabled or not for virtual machine | `bool` | `""` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | The name of the computer | `string` | `""` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Provide the size of the virtual machine | `string` | `""` | no |
## Outputs
| Name | Description |
|------|-------------|
| <a name="output_az_availability_set"></a> [az\_availability\_set](#output\_az\_availability\_set) | The output of the Availability set |
| <a name="output_az_data_disk_attachment"></a> [az\_data\_disk\_attachment](#output\_az\_data\_disk\_attachment) | The output of the attached managed disk |
| <a name="output_az_key_vault"></a> [az\_key\_vault](#output\_az\_key\_vault) | The output of the Azure key vault |
| <a name="output_az_key_vault_secret"></a> [az\_key\_vault\_secret](#output\_az\_key\_vault\_secret) | The output of the Azure key vault secret |
| <a name="output_az_managed_disk"></a> [az\_managed\_disk](#output\_az\_managed\_disk) | The output of the managed disk |
| <a name="output_az_virtual_machine"></a> [az\_virtual\_machine](#output\_az\_virtual\_machine) | The output of the Azure virtual machine |