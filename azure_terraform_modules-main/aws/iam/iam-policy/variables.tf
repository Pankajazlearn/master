variable "name" {
  description = "The name of the policy"
  type        = string
  default     = ""
}

variable "path" {
  description = "The path of the policy in IAM"
  type        = string
  default     = "/"
}

variable "description" {
  description = "The description of the policy"
  type        = string
  default     = "IAM Policy"
}

variable "policy" {
  description = "The path of the policy in IAM (tpl file)"
  type        = string
  default     = ""
}

variable "project" {
  description = "The project in which the resources are provisioned"
  type        = string
}

variable "technical_owner" {
  description = "The project in which the resources are provisioned"
  type        = string
}

variable "confidentiality" {
  description = "The project in which the resources are provisioned"
  type        = string
}

variable "environment" {
  description = "The environment used for all the resources in this provision.\nExpected values are: dev,prod,sandbox,UAT,test"
  type        = string
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
  type        = string
}

variable "owner" {
  description = "The owner of the resources to be provisioned"
  type        = string
}

variable "operational_company" {
  description = "The Operational Company for which the resorces are provisioned"
  type        = string
}
