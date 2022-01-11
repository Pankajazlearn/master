terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/aws"
      version = ">= 3.70.0"
    }
  }
  required_version = ">= 1.0.9"
}
# Specify the provider and access details
provider "aws" {
  region = "eu-west-1"
}

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
