<!-- BEGIN_TF_DOCS -->

# Azure Compute

- The compute terraform module is designed to deploy azure Linux virtual machines, with Image must be pre-existed in the account. Virtual machine is created with boot diagnostics and vm availability sets as an additional features, which are variablized. Os-disk and data-disk on instance termination flag is added and variablized.
- The password for the virtual machine is stored in azure key vault as secret, which must pre-existed with Terraform having read access for secret.
- Os-disk and data-disk are Server-side encrypted(SSE) with Platform managed keys(PMK). Count agrument is defined for managed disk to create 'n' number of managed disks and attach it to virtual machine as per requirement.

## Pre-requisites for using compute module

- Resource group must pre-exist
- Storage account must pre-exist in same resource group and region
- Image must pre-exist in same resource group and region
- Keyvault and secret must pre-exist with terraform having read access for secret must in same resource group and region

## Scenario - When Availability set is not created

- Put `create_availability_set` = false 

### `main.tf`
```hcl

module "az_compute" {
  source              = "./compute/"
  resource_group_name = "xxxxxxxxxxxxxxxxx"
  location            = "xxxxxxxxxxxxxxxxx"
  az_vnet_subnet_id   = "xxxxxxxxxxxxxxxxx"
  environment         = var.environment
  project             = var.project
  business_unit       = var.business_unit
  owner               = var.owner
  operational_company = var.operational_company

}

```

### `variables.tf`

```

variable "az_image_name" {
  description = "The name of the custom image for creating virtual machine"
  type        = string
  default     = "az-ubuntu-18.04-base-20211117"
}

variable "az_vnet_subnet_id" {
  description = "Subnet id of which the Network Interface card to be attached"
}

variable "key_vault_name" {
  description = "Provide the key vault name present in the infrastructure with service principal's read access of key vault"
  type        = string
  default     = "azkvxxxxxxxxxxx"
}

variable "key_vault_secret" {
  description = "Provide the name of key vault secret"
  type        = string
  default     = "vmpassword"
}

variable "os_disk_termination" {
  description = "Preserve volume of os disk on instance termination"
  type        = bool
  default     = false
}

variable "data_disk_termination" {
  description = "Preserve volume of data disk on instance termination"
  type        = bool
  default     = false
}

variable "project" {
  description = "Provide the project name code of the Business Unit under which the resources are provisioned"
  type        = string
  default     = "mi"
}

variable "environment" {
  description = "Provide the environment name under the resources are provisioned"
  type        = string
  default     = "dev"
}

variable "operational_company" {
  description = "Provide the Operational Company name under the resources are provisioned"
  type        = string
  default     = "b-1"
}

variable "vm_name" {
  description = "The name of the computer"
  type        = string
  default     = "comxxxx"
  #dummy value to be replaced computer name
}

variable "username" {
  description = "The username of the virtual machine"
  type        = string
  default     = "comxxxx"
  #dummy value to be replaced username of vm
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
  type        = string
  default     = "b-1"
}

variable "owner" {
  description = "The ownerin which the resources are provisioned"
  type        = string
  default     = "self"
}

variable "vm_size" {
  description = "Provide the size of the virtual machine"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "boot_diagnostics" {
  description = "Boot diagnostic feature to be enabled or not for virtual machine"
  type        = bool
  default     = false
}

variable "create_availability_set" {
  description = "Flag whether to create the availability set or not"
  type        = bool
  default     = false
}

variable "az_availability_set_name" {
  description = "Provide the name of existing availability set"
  type        = string
  default     = "as"
}

variable "vm_availability_set" {
  description = "VM availability set feature to be enabled or not for virtual machine"
  type        = bool
  default     = true
}

variable "accelerated_networking" {
  description = "Accelerated networking feature to be enabled or not for virtual machine"
  type        = bool
  default     = "false"
}

variable "number_of_disks" {
  description = "Provide the number of managed disks required"
  type        = number
  default     = 2
}

variable "managed_disk_size" {
  description = "Provide the size of the managed disk required"
  type        = number
  default     = 10
}

variable "location-id" {
  description = "Provide the location ID of Virtual/Physical Location"
  type        = string
  default     = ""
}

variable "client" {
  description = "Provide the client Name of the Organization"
  type        = string
  default     = "mi"
}

variable "device-role" {
  description = "Provide the device role code of the resources"
  type        = string
  default     = "AA"
}

variable "form-factor" {
  description = "Provide the form factor code of the resources i-e V for Virtual or P for Physical"
  type        = string
  default     = "AA"
}

variable "storage_account_name" {
  description = "Provide the name of the storage account existing in the account"
  type        = string
  default     = "xxxxxxxx"
}

variable "storage_account_uri" {
  description = "Provide the Storage account's blob endpoint"
  type        = string
  default     = ""
}

variable "location" {
  description = "Location where the resources are provisioned"
  type        = string
  default     = "uaenorth"
}

variable "resource_group_name" {
  description = "Resource group in which the resources are provisioned"
  type        = string
  default     = ""
}

variable "fault_domain_count" {
  description = "Provide the fault domain count"
  type        = number
  default     = 2
}

variable "az_vnet_subnet_name" {
  description = "Provide subnet name of virtual network"
  type        = string
  default     = ""
}

variable "az_nsg_id" {
  description = "Provide Network security group ID to which Network interface card is attached"
  type        = string
  default     = ""
}

```
## `outputs.tf`

```

#-------------------------------------------------------------
# Output of Azure Virtual Machine
#-------------------------------------------------------------

output "az_virtual_machine" {
  value = azurerm_virtual_machine.az_virtual_machine
}


<!-- END_TF_DOCS -->
