#------------------------------------------
# Data source for Transit Gateway
#------------------------------------------

data "aws_ec2_transit_gateway" "aws_transit_gateway" {
  id = var.aws_transit_gateway_id
}

#------------------------------------------
# Create Transit Gateway VPC Attachment
#------------------------------------------

resource "aws_ec2_transit_gateway_vpc_attachment" "aws_transit_gateway_vpc_attachment" {

  subnet_ids         = var.aws_subnet_ids
  transit_gateway_id = var.aws_transit_gateway_id
  vpc_id             = var.aws_vpc_id

  tags = merge(
    local.common_tags,
    {
      Name        = "route-${var.aws_route_table_name}"
      Description = "Creation of Transit Gateway VPC attachment"
    }
  )
}

#------------------------------------------
# Create custom route table
#------------------------------------------

resource "aws_route_table" "aws_route_table" {
  vpc_id = var.aws_vpc_id

   route {
      cidr_block                = var.aws_cidr_block_route_table
      transit_gateway_id        = var.aws_transit_gateway_id
    }

  tags = merge(
    local.common_tags,
    {
      Name        = "route-${var.aws_route_table_name}"
      Description = "Creation of routing table"
    }
  )
}

#-------------------------------------------------------------------
# Aws Route table and Subnet Association
#-------------------------------------------------------------------

resource "aws_route_table_association" "aws_subnet_route_table_association" {

  count          = var.number_of_subnets
  subnet_id      = var.aws_subnet_ids[count.index]
  route_table_id = aws_route_table.aws_route_table.id

}
