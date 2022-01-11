
module "project" {
  source       = "./project"
  project_name = var.project_name
  description  = var.description
  domain_id    = var.domain_id
  enabled      = var.enabled
  is_domain    = var.is_domain
  parent_id    = var.parent_id
  region       = var.region
  environment  = var.environment
}
module "identity_user" {
  source                                = "./identity_user"
  user_name                             = var.user_name
  description                           = var.description
  password                              = var.password
  ignore_change_password_upon_first_use = var.ignore_change_password_upon_first_use
  multi_factor_auth_enabled             = var.multi_factor_auth_enabled
  mfa_rule                              = var.mfa_rule
  email                                 = var.email
}

module "openstack-flavor" {
  source      = "./openstack-flavor"
  flavor_name = var.flavor_name
  falvorlist  = var.flavorlist
}
module "openstack-image" {
  source      = "./openstack-image"
  image_list  = var.image_list
}

#-----------------
# Network Creation 
#-----------------

module "openstack_network" {
  source     = "./network"

  tenant_id    = module.project.project_id
  network_list = var.network_list
}
