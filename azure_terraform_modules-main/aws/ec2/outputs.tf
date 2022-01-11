#---------------------------
# New EC2 Instance ID output
#---------------------------

output "aws_ec2_instance_id_output" {
  description = "ID of newly created EC2 instance."
  value = aws_instance.aws_ec2_instance.id
}

#----------------------------------
# New Secondary Volume/s ID output
#----------------------------------

output "aws_secondary_volume_id_output" {
  description = "List of ID/s of newly created Secondary Volume/s."
  value = [
  for aws_ebs_volume in aws_ebs_volume.aws_ebs_volume: aws_ebs_volume.id
  ]
}

#----------------------------------
# New Root Volume ID output
#----------------------------------

output "aws_root_volume_id_output" {
  description = "ID of newly created root Volume."
  value = aws_instance.aws_ec2_instance.root_block_device[0].volume_id
}
