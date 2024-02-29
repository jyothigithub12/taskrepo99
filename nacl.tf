resource "aws_network_acl" "network_nacl" {
  vpc_id = aws_vpc.aws-vpc.id

  egress {
    protocol = "tcp"
    rule_no = 200
    action = "allow"
    cidr_block = var.vpc_cidr
    from_port = 0
    to_port = 0
  }

  ingress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block = var.vpc_cidr
    from_port = 80
    to_port = 80
  }

  ingress {
    protocol = "tcp"
    rule_no = 200
    action = "allow"
    cidr_block = var.vpc_cidr
    from_port = 22
    to_port = 22
  }

  ingress {
    protocol = "tcp"
    rule_no = 300
    action = "allow"
    cidr_block = var.vpc_cidr
    from_port = 443
    to_port = 443
  }

  tags = {
    Name = "${var.product_name}-${var.environment}-nacl"
  }

}