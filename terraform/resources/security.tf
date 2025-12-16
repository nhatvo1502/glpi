resource "aws_security_group" "glpi_sg" {
    name = "glpi_sg"
    description = "For GLPI"

    vpc_id = var.vpc_id

    tags = {
        Name = "GLPI Security Group"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    security_group_id = aws_security_group.glpi_sg.id

    cidr_ipv4 = "0.0.0.0/0"
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_glpi" {
    security_group_id = aws_security_group.glpi_sg.id

    cidr_ipv4 = "0.0.0.0/0"
    from_port = 6744
    ip_protocol = "tcp"
    to_port = 6744
}

resource "aws_vpc_security_group_ingress_rule" "allow_mysql" {
    security_group_id = aws_security_group.glpi_sg.id

    cidr_ipv4 = "0.0.0.0/0"
    from_port = 3306
    ip_protocol = "tcp"
    to_port = 3306
}

resource "aws_vpc_security_group_egress_rule" "allow_outbound" {
    security_group_id = aws_security_group.glpi_sg.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
}