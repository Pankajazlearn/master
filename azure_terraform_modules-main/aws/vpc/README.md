## AWS VPC Module

- This Terraform Module creates Virtual Private Cloud

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.68.0 |

## Resources

| Name | Type |
|------|------|
| [aws_vpc.aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_cidr_vpc"></a> [aws\_cidr\_vpc](#input\_aws\_cidr\_vpc) | Provide the cidr range under which the resources are provisioned | `string` | `"9.0.0.0/16"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Provide the name of the region in which the resources need to be provisioned | `string` | `"eu-west-1"` | no |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | `"mi"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Provide the environment name under the resources are provisioned | `string` | `"dev"` | no |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | Provide the Operational Company name under which the resources are provisioned | `string` | `"mafp"` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | `"self"` | no |
| <a name="input_project"></a> [project](#input\_project) | Provide the project name code of the Business Unit under which the resources are provisioned | `string` | `"project"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_vpc"></a> [aws\_vpc](#output\_aws\_vpc) | --------------------------- New Virtual Private Cloud Output --------------------------- |
