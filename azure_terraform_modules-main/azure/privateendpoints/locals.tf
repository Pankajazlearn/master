locals {
  pe_with_zones = flatten([
    for dns_k, dns_v in var.private_endpoints : [
      for zone in coalesce(dns_v["dns_zone_names"], []) :
      {
        dns_key                    = "${dns_k}_${zone}"
        dns_zone                   = zone
        pe_name                    = dns_v["name"]
        pe_key                     = dns_k
      }
    ]
  ])
  pe_integrated_zone = {
    for pe_zone in local.pe_with_zones : pe_zone.dns_key => pe_zone
  }
}

locals {
pe_dns_zones = flatten([
    for dns_k, dns_v in var.private_endpoints : [
      for zone in coalesce(dns_v["dns_zone_names"], []) :
      {
        dns_key                    = "${dns_k}_${zone}"
        id                         = lookup(data.azurerm_private_dns_zone.dns_zone , "${dns_k}_${zone}")["id"]
        pe_key                     = dns_k
      }
    ]
  ])
  map_of_dns_zones = { for k in local.pe_dns_zones :  k.pe_key => k.id...}
}

#-
#- Tags
#-

locals {
  common_tags = {
    Environment     = var.tag_Environment
    Project         = var.tag_Project
    Owner           = var.tag_Owner
    BusinessUnit    = var.tag_BusinessUnit
    OpCo            = var.tag_OpCo
    Confidentiality = var.tag_Confidentiality
  }
}
