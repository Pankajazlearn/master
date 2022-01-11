#--------------------------------------------
# Creation of Identity user
#--------------------------------------------

resource "openstack_identity_user_v3" "os_user_1" {
  default_project_id = "${openstack_identity_project_v3.os_project_1.id}"
  name               = var.user_name
  description        = var.description

  password = var.password

  ignore_change_password_upon_first_use = var.ignore_change_password_upon_first_use

  multi_factor_auth_enabled = var.multi_factor_auth_enabled

  multi_factor_auth_rule {
    rule = ["password", "totp"]
  }

  multi_factor_auth_rule {
    rule = ["password"]
  }

  extra = {
    email = "user_1@foobar.com"
  }
}
