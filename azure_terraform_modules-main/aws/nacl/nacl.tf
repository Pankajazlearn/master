#------------------------------------
# Create Network Access Control List
#------------------------------------

resource "aws_network_acl" "aws_network_acl" {
  vpc_id = var.aws_vpc_id
  subnet_ids = var.aws_subnet_ids

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = var.egress_action
    cidr_block = var.egress_cidr_block
    from_port  = var.egress_source_port
    to_port    = var.egress_destination_port
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = var.ingress_action
    cidr_block = var.ingress_cidr_block
    from_port  = var.ingress_source_port
    to_port    = var.ingress_destination_port
  }

  tags = merge(
    local.common_tags,
    {
      Name        = "nacl-${var.project}-00${var.sequence_of_nacl}",
      Description = "Network Access Control List created with default security rules to add an additional layer of security to your VPC"
    }
  )
}
