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

    user_data = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install -y docker git
        sudo service docker start

        sudo usermod -a -G docker ec2-user

        newgrp docker

        sudo mkdir -p /usr/libexec/docker/cli-plugins/
        sudo curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m) -o /usr/libexec/docker/cli-plugins/docker-compose
        sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose

        sudo mkdir -p /opt/glpi
        sudo chown -R ec2-user:ec2-user /opt/glpi
        
        cd /opt/glpi

        git init
        git remote add origin https://github.com/nhatvo1502/glpi.git
        git sparse-checkout init --cone
        git sparse-checkout set docker

        git pull origin main

        cd /opt/glpi/docker

        sudo docker compose up
    EOF

    tags = {
        Name = "GLPI"
    }
}