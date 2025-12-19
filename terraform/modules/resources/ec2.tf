resource "aws_instance" "glpi" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.glpi_key.key_name
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.glpi_sg.id]

    root_block_device {
        volume_size = var.volume_size
        volume_type = var.volume_type
    }

    user_data = "${file("${path.module}/user-data.sh")}"

    tags = {
        Name = "GLPI"
    }
}