variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created."
  default     = ""
}

variable "location" {
  description = "A container that holds related resources for an Azure solution. To be left blank if a new Resource Group has to be created."
  default     = ""
}

variable "project" {
  description = "Provide the project name code of the Business Unit under which the resources are provisioned"
  type        = string
  default     = "mi"
}

variable "virtual_machine_id" {}

variable "environment" {
  description = "Provide the environment name under the resources are provisioned"
  type        = string
  default     = "dev"
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
  type        = string
  default     = "AA"
}

variable "owner" {
  description = "The owner of the resources are provisioned"
  type        = string
  default     = "demo@maf.ae"
}

variable "weekdays" {
  description = "Provide the weekdays for the virtual machine backup"
  type        = list(string)
  default     = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
}

variable "weeks" {
  description = "Provide the weeks for the virtual machine backup"
  type        = list(string)
  default     = ["First", "Second", "Third", "Fourth", "Last"]
}

variable "frequency" {
  description = "Provide the frequency of the virtual machine backup"
  type        = string
  default     = "Daily"
}

variable "time" {
  description = "Provide the time for the daily virtual machine backup"
  type        = string
  default     = "22:00"
}

variable "instant_retention_days" {
  description = "Provide the number instant restore retention days"
  type        = number
  default     = 5
}

variable "retention_daily" {
  description = "Provide the number of daily retentions"
  type        = number
  default     = 30
}

variable "retention_monthly" {
  description = "Provide the number of monthly retentions"
  type        = number
  default     = 60
}

variable "timezone" {
  description = "Provide the timezone of the virtual machine backup"
  type        = string
  default     = "Arabian Standard Time"
}

variable "operational_company" {
  description = "Provide the Opeartional Company name under which the resources are provisioned"
  type 	      = string
  default     = "mafp"
}

variable "soft_delete_enabled" {
  description = "Soft delete option for the Recovery service vault"
  type        = bool
  default     = false
}
