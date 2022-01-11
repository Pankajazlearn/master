variable "environment" {
  description = "The environment used for all the resources in this provision.\nExpected values are: dev,prod,sandbox,UAT,test"
  type        = string
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
}

variable "operational_company" {
  description = "The Operational Company for which the resorces are provisioned"
  type        = string
}

variable "owner" {
  description = "The owner of the resources are provisioned"
  type        = string
}

variable "project" {
  description = "The project in which the resources are provisioned"
  type        = string
}

variable "aws_instance_type" {
  type        = string
  description = "The type of instance that has to be provisioned from the AMI"
}

variable "aws_ami_owner" {
  type        = string
  description = "The owner of Amazon Machine Image (AMI)"
}

variable "aws_ami_name" {
  type        = string
  description = "The name of Amazon Machine Image (AMI)"
}

variable "aws_ami_tags" {
  type        = map(string)
  description = "The tags specified for an Amazon Machine Image (AMI)"
}

variable "aws_instance_key_name" {
  type        = string
  description = "Key name of the Key Pair to use for the instance"
}

variable "aws_kms_key_id" {
  type        = string
  description = "The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true"
}

variable "aws_subnet_id" {
  type        = string
  description = "The Subnet id to which the AWS instance should be attached to"
}

variable "availability_zone" {
  type        = string
  description = "The AZ where the EBS volume will exist"
}

variable "is_volume_encrypted" {
  type        = bool
  description = "If true, the disk will be encrypted"
  default     = true
}

variable "aws_secondary_volume_count" {
  type        = number
  description = "Number of EBS Volumes to be created for the virtual machine"
}

variable "aws_secondary_volume_size" {
  type        = number
  description = "The size of the secondary volumes in GiBs"
}

variable "aws_secondary_volume_type" {
  type        = string
  description = "The type of EBS volume. Can be standard, gp2, gp3, io1, io2, sc1 or st1 (Default: gp2)"
}

variable "aws_ebs_device_name" {
  type        = list(string)
  description = "Name of the EBS device to mount"
}

variable "aws_security_group_id" {
  type        = string
  description = "The ID of the security group"
}

variable "location_code" {
  description = "The location Code of Virtual/Physical Location"
  type        = string
}

variable "client_code" {
  description = "The client code of the organization"
  type        = string
}

variable "device_role" {
  description = "The device role code of the resources"
  type        = string
}

variable "environment_code" {
  description = "The environment code for the EC2 instance"
  type        = string
}

variable "aws_ec2_instance_sequence" {
  description = "The sequence of the EC2 instance to be created"
  type        = string
}

variable "aws_instance_profile_name" {
  description = "IAM Instance profile(name) to be assigned to the EC2 instance"
  type        = string
}

variable "aws_network_instance_sequence" {
  description = "The sequence of the Network Interface for the EC2 instance"
  type        = string
}

variable "aws_network_interface_attachment_device_index" {
  description = "The network interface's position in the attachment order. For example, the first attached network interface has a DeviceIndex of 0"
  type        = number
}

variable "should_delete_volume_on_termination" {
  description = "Should the volume be deleted after EC2 instance termination"
  type = bool
  default = false
}

variable "aws_root_volume_size" {
  type        = number
  description = "The size of the root volume in GiBs"
}

variable "aws_root_volume_type" {
  type        = string
  description = "The type of root volume. Can be standard, gp2, gp3, io1, io2, sc1 or st1 (Default: gp2)"
}
