resource "aws_subnet" "private_subnet" {
  count                   = var.pvtsubnet_multiplier * length(var.availability_zones)
  vpc_id                  = aws_vpc.aws-vpc.id
  availability_zone = element(var.availability_zones, count.index % length(var.availability_zones))
  #cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index * 4)
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index * 4 + 2)
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.product_name}-${var.environment}-pvtsub-${count.index + 4}"
  }
}