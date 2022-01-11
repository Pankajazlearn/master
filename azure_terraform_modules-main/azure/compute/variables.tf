variable "az_image_name" {
  description = "The name of the custom image for creating virtual machine"
  type        = string
  default     = ""
}

variable "az_vnet_subnet_id" {
  description = "Subnet id of which the Network Interface card to be attached"
  default    = ""
}

variable "key_vault_name" {
  description = "Provide the key vault name present in the infrastructure with service principal's read access of key vault"
  type        = string
  default     = ""
}

variable "key_vault_secret" {
  description = "Provide the name of key vault secret"
  type        = string
  default     = ""
}

variable "os_disk_termination" {
  description = "Preserve volume of os disk on instance termination"
  type        = bool
}

variable "data_disk_termination" {
  description = "Preserve volume of data disk on instance termination"
  type        = bool
}

variable "project" {
  description = "Provide the project name code of the Business Unit under which the resources are provisioned"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Provide the environment name under the resources are provisioned"
  type        = string
  default     = ""
}

variable "operational_company" {
  description = "Provide the Operational Company name under the resources are provisioned"
  type        = string
  default     = ""
}

variable "vm_name" {
  description = "The name of the computer"
  type        = string
  default     = ""
  #dummy value to be replaced computer name
}

variable "username" {
  description = "The username of the virtual machine"
  type        = string
  default     = ""
  #dummy value to be replaced username of vm
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
  type        = string
  default     = ""
}

variable "owner" {
  description = "The ownerin which the resources are provisioned"
  type        = string
  default     = ""
}

variable "vm_size" {
  description = "Provide the size of the virtual machine"
  type        = string
  default     = ""
}

variable "boot_diagnostics" {
  description = "Boot diagnostic feature to be enabled or not for virtual machine"
  type        = bool
}

variable "create_availability_set" {
  description = "Flag whether to create the availability set or not"
  type        = bool
}

variable "az_availability_set_name" {
  description = "Provide the name of existing availability set"
  type        = string
  default     = ""
}

variable "vm_availability_set" {
  description = "VM availability set feature to be enabled or not for virtual machine"
  type        = bool
}

variable "accelerated_networking" {
  description = "Accelerated networking feature to be enabled or not for virtual machine"
  type        = bool
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
  default     = ""
}

variable "device-role" {
  description = "Provide the device role code of the resources"
  type        = string
  default     = ""
}

variable "form-factor" {
  description = "Provide the form factor code of the resources i-e V for Virtual or P for Physical"
  type        = string
  default     = ""
}

variable "storage_account_name" {
  description = "Provide the name of the storage account existing in the account"
  type        = string
  default     = ""
}

variable "storage_account_uri" {
  description = "Provide the Storage account's blob endpoint"
  type        = string
  default     = ""
}

variable "location" {
  description = "Location where the resources are provisioned"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "Resource group in which the resources are provisioned"
  type	      = string
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

variable "sequence_of_network_interface" {
  description = "Resource counter"
  type        = number
  default     = 1
}

variable "sequence_of_virtual_machine" {
  description = "Resource counter"
  type        = number
  default     = 1
}
