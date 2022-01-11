<!-- BEGIN_TF_DOCS -->
# AWS EC2 Instance Module

AWS EC2 Instance Module to create EC2 instance with Volumes, and attach Primary Elastic Network Interface with a Security Group.

## Requirements

| Name | Version |
|------|---------|
| terraform | = 1.0.9 |
| aws | = 3.69.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.69.0 |


## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.aws_ebs_volume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ebs_volume) | resource |
| [aws_instance.aws_ec2_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_network_interface_sg_attachment.aws_network_interface_sg_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface_sg_attachment) | resource |
| [aws_volume_attachment.aws_ec2_volume_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/volume_attachment) | resource |
| [aws_ami.aws_ami_data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnet.aws_subnet_data](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The AZ where the EBS volume will exist | `string` | n/a | yes |
| <a name="input_aws_ami_name"></a> [aws\_ami\_name](#input\_aws\_ami\_name) | The name of Amazon Machine Image (AMI) | `string` | n/a | yes |
| <a name="input_aws_ami_owner"></a> [aws\_ami\_owner](#input\_aws\_ami\_owner) | The owner of Amazon Machine Image (AMI) | `string` | n/a | yes |
| <a name="input_aws_ami_tags"></a> [aws\_ami\_tags](#input\_aws\_ami\_tags) | The tags specified for an Amazon Machine Image (AMI) | `map(string)` | n/a | yes |
| <a name="input_aws_ebs_device_name"></a> [aws\_ebs\_device\_name](#input\_aws\_ebs\_device\_name) | Name of the EBS device to mount | `list(string)` | n/a | yes |
| <a name="input_aws_ebs_volume_count"></a> [aws\_ebs\_volume\_count](#input\_aws\_ebs\_volume\_count) | Number of EBS Volumes to be created for the virtual machine | `number` | n/a | yes |
| <a name="input_aws_ebs_volume_size"></a> [aws\_ebs\_volume\_size](#input\_aws\_ebs\_volume\_size) | The size of the drive in GiBs | `number` | n/a | yes |
| <a name="input_aws_ebs_volume_type"></a> [aws\_ebs\_volume\_type](#input\_aws\_ebs\_volume\_type) | The type of EBS volume. Can be standard, gp2, gp3, io1, io2, sc1 or st1 (Default: gp2) | `string` | n/a | yes |
| <a name="input_aws_ec2_instance_sequence"></a> [aws\_ec2\_instance\_sequence](#input\_aws\_ec2\_instance\_sequence) | The sequence of the EC2 instance to be created | `string` | n/a | yes |
| <a name="input_aws_instance_key_name"></a> [aws\_instance\_key\_name](#input\_aws\_instance\_key\_name) | Key name of the Key Pair to use for the instance | `string` | n/a | yes |
| <a name="input_aws_instance_profile_name"></a> [aws\_instance\_profile\_name](#input\_aws\_instance\_profile\_name) | IAM Instance profile(name) to be assigned to the EC2 instance | `string` | n/a | yes |
| <a name="input_aws_instance_type"></a> [aws\_instance\_type](#input\_aws\_instance\_type) | The type of instance that has to be provisioned from the AMI | `string` | n/a | yes |
| <a name="input_aws_kms_key_id"></a> [aws\_kms\_key\_id](#input\_aws\_kms\_key\_id) | The ARN for the KMS encryption key. When specifying kms\_key\_id, encrypted needs to be set to true | `string` | n/a | yes |
| <a name="input_aws_security_group_id"></a> [aws\_security\_group\_id](#input\_aws\_security\_group\_id) | The ID of the security group | `string` | n/a | yes |
| <a name="input_aws_subnet_id"></a> [aws\_subnet\_id](#input\_aws\_subnet\_id) | The Subnet id to which the AWS instance should be attached to | `string` | n/a | yes |
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | The business unit in which the resources are provisioned | `any` | n/a | yes |
| <a name="input_client_code"></a> [client\_code](#input\_client\_code) | The client code of the organization | `string` | n/a | yes |
| <a name="input_device_role"></a> [device\_role](#input\_device\_role) | The device role code of the resources | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment used for all the resources in this provision.<br>Expected values are: dev,prod,sandbox,UAT,test | `string` | n/a | yes |
| <a name="input_environment_code"></a> [environment\_code](#input\_environment\_code) | The environment code for the EC2 instance | `string` | n/a | yes |
| <a name="input_form_factor"></a> [form\_factor](#input\_form\_factor) | Provide the form factor code of the resources i.e., V for Virtual or P for Physical | `string` | n/a | yes |
| <a name="input_is_aws_ebs_volume_encrypted"></a> [is\_aws\_ebs\_volume\_encrypted](#input\_is\_aws\_ebs\_volume\_encrypted) | If true, the disk will be encrypted | `bool` | `true` | no |
| <a name="input_location_code"></a> [location\_code](#input\_location\_code) | The location Code of Virtual/Physical Location | `string` | n/a | yes |
| <a name="input_operational_company"></a> [operational\_company](#input\_operational\_company) | The Operational Company for which the resorces are provisioned | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | The owner of the resources are provisioned | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project in which the resources are provisioned | `string` | n/a | yes |
| <a name="input_should_delete_volume_on_termination"></a> [should\_delete\_volume\_on\_termination](#input\_should\_delete\_volume\_on\_termination) | Should the volume be deleted after EC2 instance termination | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_ec2_instance_id_output"></a> [aws\_ec2\_instance\_id\_output](#output\_aws\_ec2\_instance\_id\_output) | ID of newly created EC2 instance. |

## Expected

```
aws_ebs_volume_id_output = [
  "vol-xxx",
  "vol-xxx",
]

aws_ec2_instance_id_output = "i-xxx"

```

<!-- END_TF_DOCS -->
