variable "resource_group_name" {
  type        = string
  description = "Resource Group name of private endpoint."
  default     = null
}

# -	
# - Private Endpoints
# -
variable "private_endpoints" {
  type = map(object({
    name                      = string
    subnet_id                 = string
    subnet_name               = string
    vnet_name                 = string
    networking_resource_group = string
    resource_name             = string
    group_ids                 = list(string)
    approval_required         = bool
    approval_message          = string
    dns_zone_names            = list(string)
    dns_zone_group_name       = string 
    dns_rg_name               = string
    private_connection_address_id = string
  }))
  description = "Map containing Private Endpoint and Private DNS Zone details"
  default     = {}
}

variable "approval_message" {
  type        = string
  description = "A message passed to the owner of the remote resource when the private endpoint attempts to establish the connection to the remote resource"
  default     = "Please approve my private endpoint connection request"
}

variable "tag_Environment" {
  type        = string
  description = "Private Endpoint tag Environment"
}

variable "tag_Project" {
  type        = string
  description = "Private Endpoint tag Project"
}

variable "tag_Owner" {
  type        = string
  description = "Private Endpoint tag Owner"
}

variable "tag_BusinessUnit" {
  type        = string
  description = "Private Endpoint tag BusinessUnit"
}

variable "tag_OpCo" {
  type        = string
  description = "Private Endpoint tag OpCo"
}

variable "tag_Confidentiality" {
  type        = string
  description = "Private Endpoint tag confidentiality"
}
