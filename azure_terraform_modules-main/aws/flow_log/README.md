## AWS Flow Logs Module

- This Terraform Module creates a S3 bucket and stores the Flow Logs in the S3 bucket created

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.68.0 |

## Resources

| Name | Type |
|------|------|
| [aws_flow_log.aws_flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_s3_bucket.aws_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Provide the abbreviation name of the region in which the resources need to be provisioned | `string` | n/a | yes |
| <a name="input_aws_vpc_id"></a> [aws\_vpc\_id](#input\_aws\_vpc\_id) | Provide the VPC ID under which the resources are provisioned | `string` | `""` | no |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_count_of_s3_bucket"></a> [count\_of\_s3\_bucket](#input\_count\_of\_s3\_bucket) | Provide the count of S3 Bucket under which the resources are provisioned | `number` | `1` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Provide the environment name under the resources are provisioned | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | Provide the Operational Company name under which the resources are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Provide the project name code of the Business Unit under which the resources are provisioned | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_flow_logs_output"></a> [aws\_flow\_logs\_output](#output\_aws\_flow\_logs\_output) | The output of AWS Flow Logs |
