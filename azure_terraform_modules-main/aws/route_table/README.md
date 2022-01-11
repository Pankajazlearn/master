## AWS Route Table Module

- This Terraform Module uses Transit gateway as Data source. Attaches the Transit Gateway with the VPC using Transit Gateway Attachment Resource and add a Route for Transit Gateway.
- Route Table and Subnets are associated using Route table and Subnet attachment Resource

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.68.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway_vpc_attachment.aws_transit_gateway_vpc_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
| [aws_route_table.aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.aws_subnet_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_ec2_transit_gateway.aws_transit_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_transit_gateway) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_cidr_block_route_table"></a> [aws\_cidr\_block\_route\_table](#input\_aws\_cidr\_block\_route\_table) | Provide the Cidr block for transit gateway under which the resources are provisioned | `string` | n/a | yes |
| <a name="input_aws_cidr_vpc"></a> [aws\_cidr\_vpc](#input\_aws\_cidr\_vpc) | Provide the cidr range under which the resources are provisioned | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Provide the name of the region in which the resources need to be provisioned | `string` | n/a | yes |
| <a name="input_aws_route_table_name"></a> [aws\_route\_table\_name](#input\_aws\_route\_table\_name) | Provide the route table name under which the resources are provisioned | `string` | n/a | yes |
| <a name="input_aws_subnet_ids"></a> [aws\_subnet\_ids](#input\_aws\_subnet\_ids) | Provide the Subnet IDs under which the resources are provisioned | `list` | `[]` | no |
| <a name="input_aws_transit_gateway_id"></a> [aws\_transit\_gateway\_id](#input\_aws\_transit\_gateway\_id) | Provide the Transit Gateway ID under which the resources are provisioned | `string` | n/a | yes |
| <a name="input_aws_vpc_id"></a> [aws\_vpc\_id](#input\_aws\_vpc\_id) | Provide the VPC ID under which the resources are provisioned | `string` | `""` | no |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Provide the environment name under the resources are provisioned | `string` | n/a | yes |
| <a name="input_number_of_subnets"></a> [number\_of\_subnets](#input\_number\_of\_subnets) | Number of subnet to be associated with route table | `number` | `3` | no |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | Provide the Operational Company name under which the resources are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Provide the project name code of the Business Unit under which the resources are provisioned | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_route_table_id"></a> [aws\_route\_table\_id](#output\_aws\_route\_table\_id) | Output of Route Table ID |
