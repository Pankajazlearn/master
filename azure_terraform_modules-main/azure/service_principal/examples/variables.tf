variable "application_name" {
  type        = string
  description = "Display name for the Service principal"
  default     = "application"
}

variable "existing_service_principal" {
  type        = string
  description = "Display name for the Existing Service principal"
  default     = "application"
}

variable "create_service_principal" {
  type        = bool
  description = "Whether to create a service principal or use the existing one"
  default     = false
}

variable "role_definition_name" {
  type        = string
  description = "Name of the built-in Role for the service principal"
  default     = "Contributor"
}

variable "sequence_of_service_principal" {
  type        = number
  description = "Resource counter for service principal"
  default     = 1
}
