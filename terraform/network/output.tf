output "vpc_id" {
  value = aws_vpc.glpi_vpc.id
}

output "subnet_id" {
  value = aws_subnet.glpi_subnet.id
}