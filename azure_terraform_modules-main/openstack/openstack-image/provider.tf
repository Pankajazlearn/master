provider "openstack" {
  user_name   = "admin"
  tenant_name = "alt_demo"
  password    = "admin"
  auth_url    = "http://3.239.211.44/identity"
  region      = "RegionOne"
}

