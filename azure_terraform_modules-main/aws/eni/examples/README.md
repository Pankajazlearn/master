<!-- BEGIN_TF_DOCS -->
# Elastic Network Interface 

Configuration in this directory creates an AWS Elastic Network Interface.

## Module Usage

Following example to create an AWS Elastic Network Interface.

### `main.tf`
```hcl
module "aws_eni" {
    source = "../"

    environment           = "dev"
    owner                 = "example@maf.ae"
    business_unit         = "BU"
    project               = "example"
    operational_company   = "OpCo"
    location_abbreviation = "weu1"

    aws_network_interface_sequence = "009"
    aws_network_interface_attachment_device_index = "1"
    aws_ec2_instance_id                           = "i-xxxxxx"
    aws_ec2_instance_name                         = "ARDVNETDEV001"
    aws_subnet_id                                 = "subnet-xxxxxx"
}
```

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_eni_output"></a> [aws\_eni\_output](#output\aws\_eni\_output) | ID of new ENI created. |

<!-- END_TF_DOCS -->
