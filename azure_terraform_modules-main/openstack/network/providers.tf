# Define required providers
terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "alt_demo"
  password    = "admin"
  auth_url    = "http://3.239.211.44/identity"
  region      = "RegionOne"
}
