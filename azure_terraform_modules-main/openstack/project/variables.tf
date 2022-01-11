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

