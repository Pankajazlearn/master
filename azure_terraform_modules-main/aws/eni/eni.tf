#--------------------------------------------------
# Creation of an Network Interface for the Instance 
#--------------------------------------------------

resource "aws_network_interface" "aws_network_interface" {
  subnet_id = var.aws_subnet_id

  tags = merge(
    local.common_tags,
    {
      Name        = "nic-${local.ec2_instance_name}-${var.aws_network_interface_sequence}",
      Description = "A Network Interface for the ${local.ec2_instance_name} EC2 instance."
    }
  )
}

#------------------------------------------------
# Attachment of Network Interface to the Instance 
#------------------------------------------------

resource "aws_network_interface_attachment" "aws_network_interface_attachment" {
  instance_id          = var.aws_ec2_instance_id
  network_interface_id = aws_network_interface.aws_network_interface.id
  device_index         = var.aws_network_interface_attachment_device_index
}
