resource "aws_internet_gateway" "glpi_igw" {
    vpc_id = aws_vpc.glpi_vpc.id

    tags = {
        Name = "GLPI IGW"
    }
}