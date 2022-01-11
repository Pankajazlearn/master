variable "networklist" {
  type = map(object({
    name    = string
    subnets = map(string)
  }))
  description = "Details of network/s to be created."

}

variable "tenant_id" {
  type        = string
  description = "The owner of the network. Required if admin wants to create a network for another tenant."
}
