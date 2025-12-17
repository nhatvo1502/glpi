resource "aws_route_table" "glpi_rt" {
    vpc_id = aws_vpc.glpi_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.glpi_igw.id
    }

    tags = {
        Name = "GLPI Route Table"
    }
}

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.glpi_subnet.id
    route_table_id = aws_route_table.glpi_rt.id
}