#----------------------------------------------------------------
# Data Source for Availability Zones
#----------------------------------------------------------------

data "aws_availability_zones" "aws_availability_zones" {
  state = "available"
}

#-----------------------------------------------------------------
# Create Subnets in Available Availability Zones
#-----------------------------------------------------------------

resource "aws_subnet" "aws_subnet" {
  count = "${var.count_of_availability_zones}"
  vpc_id = var.aws_vpc_id
  cidr_block = "${element(var.aws_cidr_subnet, count.index)}"
  availability_zone = "${data.aws_availability_zones.aws_availability_zones.names[count.index]}"

  tags = merge(
    local.common_tags,
    {
      Name        = "snet-${var.environment}-${var.aws_region}-00${count.index+1}"
      Description = "Creation of Subnet in different Availability zones"
    }
  )
}
