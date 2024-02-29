# Create a public route table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.aws-vpc.id
  tags = {
    Name = "${var.product_name}-${var.environment}-pubrt"
  }
}

# Create a route in the public route table for internet access
resource "aws_route" "public_subnet_route" {
  for_each = { for idx, subnet in aws_subnet.public_subnet : idx => subnet }

  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

# Associate the public route table with all public subnets
resource "aws_route_table_association" "public_subnet_association" {
  for_each = {
    for idx, subnet in aws_subnet.public_subnet : idx => subnet.id
  }

  subnet_id      = each.value
  route_table_id = aws_route_table.public_route_table.id
}
