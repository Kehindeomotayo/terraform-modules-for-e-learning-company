output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "project_name" {
  value = var.project_name
}

output "environment" {
  value = var.environment
}

output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}
output "availability_zone_1" {
  value = data.aws_availability_zones.availability_zones.names[0]
}

output "availability_zone_2" {
  value = data.aws_availability_zones.availability_zones.names[1]
}
output "private_subnet_az1_id" {
  value = aws_subnet.private_subnet_az1.id
}

output "private_subnet_az2_id" {
  value = aws_subnet.private_subnet_az2.id
}

output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway

}
