## AWS NACL Module

- This Terraform Module creates NACL with all parameters variablized and Subnet associated

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.68.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.68.0 |

## Resources

| Name | Type |
|------|------|
| [aws_network_acl.aws_network_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Provide the name of the region in which the resources need to be provisioned | `string` | n/a | yes |
| <a name="input_aws_subnet_ids"></a> [aws\_subnet\_ids](#input\_aws\_subnet\_ids) | Provide the Subnet IDs | `list` | `[]` | no |
| <a name="input_aws_vpc_id"></a> [aws\_vpc\_id](#input\_aws\_vpc\_id) | Provide the VPC ID | `string` | `""` | no |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_count_of_nacl"></a> [count\_of\_nacl](#input\_count\_of\_nacl) | Provide count of the number of Network Access Control List's to be created | `number` | `1` | no |
| <a name="input_egress_action"></a> [egress\_action](#input\_egress\_action) | Provide the action for egress traffic | `string` | n/a | yes |
| <a name="input_egress_cidr_block"></a> [egress\_cidr\_block](#input\_egress\_cidr\_block) | Provide the cidr block for egress traffic | `string` | n/a | yes |
| <a name="input_egress_destination_port"></a> [egress\_destination\_port](#input\_egress\_destination\_port) | Provide the egress destination port | `number` | n/a | yes |
| <a name="input_egress_source_port"></a> [egress\_source\_port](#input\_egress\_source\_port) | Provide the egress source port | `number` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Provide the environment name under the resources are provisioned | `string` | n/a | yes |
| <a name="input_ingress_action"></a> [ingress\_action](#input\_ingress\_action) | Provide the action for ingress traffic | `string` | n/a | yes |
| <a name="input_ingress_cidr_block"></a> [ingress\_cidr\_block](#input\_ingress\_cidr\_block) | Provide the cidr block for ingress traffic | `string` | n/a | yes |
| <a name="input_ingress_destination_port"></a> [ingress\_destination\_port](#input\_ingress\_destination\_port) | Provide the ingress destination port | `number` | n/a | yes |
| <a name="input_ingress_source_port"></a> [ingress\_source\_port](#input\_ingress\_source\_port) | Provide the ingress source port | `number` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | Provide the Operational Company name under which the resources are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Provide the project or application name under which the resources are provisioned | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_nacl_id_output"></a> [aws\_nacl\_id\_output](#output\_aws\_nacl\_id\_output) | The output of Network Access Control List ID |
