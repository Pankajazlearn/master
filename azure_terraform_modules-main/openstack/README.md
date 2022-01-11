
## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_identity_user"></a> [identity\_user](#module\_identity\_user) | ./identity_user | n/a |
| <a name="module_openstack-flavor"></a> [openstack-flavor](#module\_openstack-flavor) | ./openstack-flavor | n/a |
| <a name="module_openstack-image"></a> [openstack-image](#module\_openstack-image) | ./openstack-image | n/a |
| <a name="module_openstack_network"></a> [openstack\_network](#module\_openstack\_network) | ./network | n/a |
| <a name="module_project"></a> [project](#module\_project) | ./project | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | A description of the user | `string` | n/a | yes |
| <a name="input_domain_id"></a> [domain\_id](#input\_domain\_id) | The domain this project belongs to | `string` | n/a | yes |
| <a name="input_email"></a> [email](#input\_email) | Free-form key/value pairs of extra information | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Whether the project is enabled or disabled. Valid values are true and false. Default is true | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment in which the resources are created | `string` | n/a | yes |
| <a name="input_falvor_name"></a> [falvor\_name](#input\_falvor\_name) | n/a | `string` | `"falvor_test1"` | no |
| <a name="input_falvorlist"></a> [falvorlist](#input\_falvorlist) | n/a | <pre>map(object({<br>    name = string<br>    vcpu = number<br>    ram  = number<br>    disk = number<br>    extra_specs = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_ignore_change_password_upon_first_use"></a> [ignore\_change\_password\_upon\_first\_use](#input\_ignore\_change\_password\_upon\_first\_use) | User will not have to change their password upon first use. Valid values are true and false | `bool` | `false` | no |
| <a name="input_image_list"></a> [image\_list](#input\_image\_list) | n/a | <pre>map(object({<br>  name = string<br>  image_source_url = string<br>  }))</pre> | n/a | yes |
| <a name="input_is_domain"></a> [is\_domain](#input\_is\_domain) | Whether this project is a domain. Valid values are true and false. Default is false. Changing this creates a new project/domain | `bool` | n/a | yes |
| <a name="input_mfa_rule"></a> [mfa\_rule](#input\_mfa\_rule) | A multi-factor authentication rule | `string` | n/a | yes |
| <a name="input_multi_factor_auth_enabled"></a> [multi\_factor\_auth\_enabled](#input\_multi\_factor\_auth\_enabled) | Whether to enable multi-factor authentication. Valid values are true and false | `bool` | `true` | no |
| <a name="input_networklist"></a> [networklist](#input\_networklist) | n/a | <pre>map(object({<br>    name    = string<br>    subnets = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_parent_id"></a> [parent\_id](#input\_parent\_id) | The parent of this project. Changing this creates a new project | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | The password for the user | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which to obtain the V3 Keystone client. If omitted, the region argument of the provider is used. Changing this creates a new project | `string` | n/a | yes |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The name of the user | `string` | n/a | yes |

