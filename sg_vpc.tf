# Create a security group
resource "aws_security_group" "security_group" {
  name        = "${var.product_name}-${var.environment}-sg"
  description = "project security group"
  vpc_id      = aws_vpc.aws-vpc.id

  dynamic "ingress" {
    for_each = var.office_ips
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = [ingress.value]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.product_name}-${var.environment}-sg"
  }
}


# ### Creating Security Group for EC2
# resource "aws_security_group" "rabbitmq-sg" {
#   name        = "oskillrabbitmq-sg"
#   description = "Allow TLS inbound traffic"
#   //vpc_id      = aws_vpc.main.id

#   dynamic "ingress" {
#     for_each = var.allowed_ports
#     content {
#       from_port   = ingress.value
#       to_port     = ingress.value
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
#   tags = {
#     Name = "oskill-sg"
#   }
# }
