#--------------------------------------------
# Creation of a Project in a Domain
#--------------------------------------------

resource "openstack_identity_project_v3" "os_project_1" {
  name        = var.project_name
  description = var.description
  domain_id   = var.domain_id
  enabled     = var.enabled
  is_domain   = var.is_domain
  parent_id   = var.parent_id
  region      = var.region

  tags = {
    environment = var.environment
  }
}
