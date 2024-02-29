# Create a private route table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.aws-vpc.id
  tags = {
    Name = "${var.product_name}-${var.environment}-pvtrt"
  }
}

# Create a route in the private route table for traffic to the NAT Gateway
resource "aws_route" "nat_gateway_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id # Replace with your NAT Gateway ID
}


# Use dynamic "for_each" to associate the private route table with all private subnets
resource "aws_route_table_association" "private_subnet_association" {
  for_each       = { for idx, subnet in aws_subnet.private_subnet : idx => subnet.id } # You can use any of the private_subnet lists here
  subnet_id      = each.value
  route_table_id = aws_route_table.private_route_table.id
}