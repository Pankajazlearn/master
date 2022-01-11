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