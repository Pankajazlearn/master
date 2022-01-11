<!-- BEGIN_TF_DOCS -->
# AWS EC2 Instance Module

AWS ENI Module to create a new Elastic Network Interface and attach it to sn existing EC2 Instance.

## Requirements

| Name | Version |
|------|---------|
| terraform | = 1.0.9 |
| aws | = 3.70.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.70.0 |

## Resources

| Name | Type |
|------|------|
| [aws_network_interface.aws_network_interface](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_network_interface_attachment.aws_network_interface_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_ec2_instance_id"></a> [aws\_ec2\_instance\_id](#input\_aws\_ec2\_instance\_id) | Instance ID to attach | `string` | n/a | yes |
| <a name="input_aws_ec2_instance_name"></a> [aws\_ec2\_instance\_name](#input\_aws\_ec2\_instance\_name) | Instance Name to attach | `any` | n/a | yes |
| <a name="input_aws_network_interface_sequence"></a> [aws\_network\_interface\_sequence](#input\_aws\_network\_instance\_sequence) | The sequence of the Network Interface for the EC2 instance | `string` | n/a | yes |
| <a name="input_aws_network_interface_attachment_device_index"></a> [aws\_network\_interface\_attachment\_device\_index](#input\_aws\_network\_interface\_attachment\_device\_index) | The network interface's position in the attachment order. The index should be 1 or more as the Primary Network Interface takes up index 0 | `number` | n/a | yes |
| <a name="input_aws_subnet_id"></a> [aws\_subnet\_id](#input\_aws\_subnet\_id) | The Subnet id to which the AWS instance should be attached to | `string` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision.<br>Expected values are: dev,prod,sandbox,UAT,test | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | The Operational Company for which the resorces are provisioned | `string` | n/a| yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project in which the resources are provisioned | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_network_interface_id_output"></a> [aws\_network\_interface\_id\_output](#output\_aws\_network\_interface\_id\_output) | ID of newly created Network Interface. |

## Expected

```
aws_network_interface_id_output = "eni-xxx"
```

<!-- END_TF_DOCS -->
