#-------------------------------------------------
# Create security group to allow port
#-------------------------------------------------

resource "aws_security_group" "aws_security_group" {
  name        = "${var.project}-sg-00${var.sequence_of_security_group}"
  description = "Allow inbound and outbound traffic"
  vpc_id      = var.aws_vpc_id

  dynamic "ingress" {
    for_each = var.aws_security_group_ingress
    content {
      self             = lookup(ingress.value, "self", null)
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", "")
      description      = lookup(ingress.value, "description", null)
      from_port        = lookup(ingress.value, "from_port", 0)
      to_port          = lookup(ingress.value, "to_port", 0)
      protocol         = lookup(ingress.value, "protocol", "-1")
    }
  }

  dynamic "egress" {
    for_each = var.aws_security_group_egress
    content {
      self             = lookup(egress.value, "self", null)
      cidr_blocks      = lookup(egress.value, "cidr_blocks", "")
      description      = lookup(egress.value, "description", null)
      from_port        = lookup(egress.value, "from_port", 0)
      to_port          = lookup(egress.value, "to_port", 0)
      protocol         = lookup(egress.value, "protocol", "-1")
    }
  }

  tags = merge(
    local.common_tags,
    {
      Name        = "${var.project}-sg-00${var.count_of_security_group}",
      Description = "Secuirty Group created with default security rules."
    }
  )
}

