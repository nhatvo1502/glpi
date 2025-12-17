resource "aws_subnet" "glpi_subnet" {
    vpc_id = aws_vpc.glpi_vpc.id
    cidr_block = "10.0.0.0/24"

    map_public_ip_on_launch = true

    tags = {
        Name = "GLPI VPC Subnet"
    }
}