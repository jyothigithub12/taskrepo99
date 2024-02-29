resource "aws_subnet" "public_subnet" {
  count                   = var.pubsubnet_multiplier * length(var.availability_zones) 
  vpc_id                  = aws_vpc.aws-vpc.id
  #cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index * 4)
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index * 4)
  #availability_zone       = var.availability_zones[count.index]
  availability_zone = element(var.availability_zones, count.index % length(var.availability_zones))
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.product_name}-${var.environment}-pubsub-${count.index + 1}"
  }
}