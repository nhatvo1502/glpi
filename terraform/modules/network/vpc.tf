resource "aws_vpc" "glpi_vpc" {
    cidr_block = "10.0.0.0/16"
    region = "us-west-1"

    tags = {
        Name = "GLPI VPC"
    }
}