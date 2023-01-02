output "test_public_subnet" {
  value = aws_subnet.public_subnet.id
  description = "public subnet"
}

output "default_vpc_sg" {
  value = aws_vpc.vpc.default_security_group_id
  description = "default sg for vpc"
}