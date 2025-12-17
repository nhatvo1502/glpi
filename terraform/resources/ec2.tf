resource "aws_instance" "glpi" {
    ami = var.iam
    instance_type = var.instance_type
    key_name = aws_key_pair.glpi_key.key_name
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.glpi_sg.id]

    root_block_device {
        volume_size = var.volume_size
        volume_type = var.volume_type
    }

    user_data = <<-EOF
        #!/bin/bash
        mkdir -p /opt/glpi/test
        chown -R ec2-user:ec2-user /opt/glpi
    EOF

    tags = {
        Name = "GLPI"
    }
}