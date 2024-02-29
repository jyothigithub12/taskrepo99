# Create an Elastic IP (EIP) for the NAT Gateway
resource "aws_eip" "nat_gateway_eip" {
  instance = null
  tags = {
    Name = "${var.product_name}-${var.environment}-eip"
  }

}

# Create a NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet[0].id # Replace with the ID of one of your public subnets
  tags = {
    Name = "${var.product_name}-${var.environment}-natgateway"
  }

}




# # Create Elastic IPs (EIPs) for NAT Gateways for production
# resource "aws_eip" "nat_gateway_eip" {
#   count = length(var.availability_zones)

#   instance = null
#   tags = {
#     Name = "${var.product_name}-${var.environment}-eip-${element(var.availability_zones, count.index)}"
#   }
# }

# # Create NAT Gateways in each availability zone for production
# resource "aws_nat_gateway" "nat_gateway" {
#   count = length(var.availability_zones)

#   allocation_id = aws_eip.nat_gateway_eip[count.index].id
#   subnet_id     = aws_subnet.public_subnet[count.index].id  # Assuming you have a corresponding public subnet for each availability zone
#   tags = {
#     Name = "${var.product_name}-${var.environment}-natgateway-${element(var.availability_zones, count.index)}"
#   }
# }

