# Create VPC
resource "aws_vpc" "aws-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.product_name}-${var.environment}-vpc"
  }
}