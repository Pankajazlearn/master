variable "application_name" {
  type = string
  description = "Display name for the Service principal"
  default = "application"
}

variable "existing_service_principal" {
  type = string
  description = "Display name for the Existing Service principal"
  default = "application"
}

variable "create_service_principal" {
  type = bool
  description = "Whether to create a service principal or use the existing one"
  default = true
}

variable "role_definition_name" {
  type = string
  description = "Name for the built-in Role for the Service principal"
  default = "Contributor"
}

variable "sequence_of_service_principal" {
  type = number
  description = "Resource counter for service principal"
  default = 1
}
