# Create an Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.aws-vpc.id
  tags = {
    Name = "${var.product_name}_${var.environment}_igw"
  }
}
