# -
# - Locals for Load Balancer NAT Rule
# -

locals {
  load_balancer_nat_rules_list = flatten([
    for nat_k, nat_v in var.load_balancer_nat_rules : [
      for key in coalesce(nat_v.lb_keys, []) : {
        key      = nat_k
        lb_key   = key
        nat_rule = nat_v
      }
    ]
  ])

  load_balancer_nat_rules = {
    for nat_rule in local.load_balancer_nat_rules_list :
    format("%s_%s", nat_rule.key, nat_rule.lb_key) => nat_rule
  }
}
# -
# - Locals for Load Balancer Tags
# -
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
