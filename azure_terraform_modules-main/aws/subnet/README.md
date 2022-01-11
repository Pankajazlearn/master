## AWS Subnet Module

- This Terraform Module uses Availability zone as data source and creates Subnet in available Availability zones

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.68.0 |

## Resources

| Name | Type |
|------|------|
| [aws_subnet.aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_availability_zones.aws_availability_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_cidr_first_two_bytes"></a> [aws\_cidr\_first\_two\_bytes](#input\_aws\_cidr\_first\_two\_bytes) | Provide the first two bytes of cidr under which the resources are provisioned | `string` | `"10.0"` | no |
| <a name="input_aws_cidr_fourth_byte_and_mask"></a> [aws\_cidr\_fourth\_byte\_and\_mask](#input\_aws\_cidr\_fourth\_byte\_and\_mask) | Provide the fourth byte and subnet mask of cidr under which the resources are provisioned | `string` | `"0/24"` | no |
| <a name="input_aws_cidr_subnet"></a> [aws\_cidr\_subnet](#input\_aws\_cidr\_subnet) | The CIDR range of the Subnet/s that should be created in the new Vnet.<br>  Enter comma separated values of Subnet/s CIDR if more than one Subnet is needed.<br>  example: 10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24 | `string` | n/a | yes |
| <a name="input_aws_cidr_third_byte"></a> [aws\_cidr\_third\_byte](#input\_aws\_cidr\_third\_byte) | Provide the third bytes of cidr under which the resources are provisioned | `string` | `"0"` | no |
| <a name="input_aws_cidr_vpc"></a> [aws\_cidr\_vpc](#input\_aws\_cidr\_vpc) | Provide the cidr range under which the resources are provisioned | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Provide the name of the region in which the resources need to be provisioned | `string` | n/a | yes |
| <a name="input_aws_route_table_id"></a> [aws\_route\_table\_id](#input\_aws\_route\_table\_id) | Provide the Route table ID under which the resources are provisioned | `string` | `""` | no |
| <a name="input_aws_subnet_id"></a> [aws\_subnet\_id](#input\_aws\_subnet\_id) | Provide the Subnet IDs under which the resources are provisioned | `list` | `[]` | no |
| <a name="input_aws_vpc_id"></a> [aws\_vpc\_id](#input\_aws\_vpc\_id) | Provide the VPC ID under which the resources are provisioned | `string` | `""` | no |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_count_of_availability_zones"></a> [count\_of\_availability\_zones](#input\_count\_of\_availability\_zones) | Count of Availability zones needed to be created | `number` | `3` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Provide the environment name under the resources are provisioned | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | Provide the Operational Company name under which the resources are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Provide the project name code of the Business Unit under which the resources are provisioned | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_subnet"></a> [aws\_subnet](#output\_aws\_subnet) | n/a |
| <a name="output_aws_subnet_id_output"></a> [aws\_subnet\_id\_output](#output\_aws\_subnet\_id\_output) | n/a |
