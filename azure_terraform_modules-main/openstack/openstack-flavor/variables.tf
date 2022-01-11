##----------------
## variables of flavor
##---------------
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
