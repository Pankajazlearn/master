variable "networklist" {
  type = map(object({
    name    = string
    subnets = map(string)
  }))
}

variable "project_name" {
  type = string
  description = "The name of the project"
}

variable "description" {
  type = string
  description = "A description of the project"
}

variable "domain_id" {
  type = string
  description = "The domain this project belongs to"
}

variable "enabled" {
  type = bool
  description = "Whether the project is enabled or disabled. Valid values are true and false. Default is true"
}

variable "is_domain" {
  type = bool
  description = "Whether this project is a domain. Valid values are true and false. Default is false. Changing this creates a new project/domain"
}

variable "parent_id" {
  type = string
  description = "The parent of this project. Changing this creates a new project"
}

variable "region" {
  type = string
  description = "The region in which to obtain the V3 Keystone client. If omitted, the region argument of the provider is used. Changing this creates a new project"
}

variable "environment" {
  type = string
  description = "The environment in which the resources are created"
}

variable "user_name" {
    type        = string
    description = "The name of the user"
}

variable "description" {
    type        = string
    description = "A description of the user"
}

variable "password" {
    type        = string
    description = "The password for the user"
}

variable "ignore_change_password_upon_first_use" {
    type        = bool
    description = "User will not have to change their password upon first use. Valid values are true and false"
    default     = false
}

variable "multi_factor_auth_enabled" {
    type        = bool
    description = "Whether to enable multi-factor authentication. Valid values are true and false"
    default     = true
}

variable "mfa_rule" {
    type        = string
    description = "A multi-factor authentication rule"
}

variable "email" {
    type        = string
    description = "Free-form key/value pairs of extra information"
}

variable "falvor_name" {
  type        = string
  default     = "falvor_test1"
}

variable "falvorlist" {
  type = map(object({
    name = string
    vcpu = number
    ram  = number
    disk = number
    extra_specs = map(string)
  }))
}

variable "image_list" {
  type = map(object({
  name = string
  image_source_url = string
  }))
}

