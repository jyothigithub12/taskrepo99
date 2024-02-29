output "elastic_ip" {
  value = aws_eip.nat_gateway_eip.public_ip
}

# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.aws-vpc.id
}

