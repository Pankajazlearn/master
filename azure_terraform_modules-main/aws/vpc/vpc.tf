#---------------------------------------------
# Create Virtual Pivate Cloud
#---------------------------------------------

resource "aws_vpc" "aws_vpc" {
  cidr_block = "${var.aws_cidr_vpc}"

  tags = merge(
    local.common_tags,
    {
      Name        = "vpc-${local.environment_location_infix}-00${var.sequence_of_vpc}"
      Description = "Creation of Virtual Privarte Cloud"
    }
  )
}


