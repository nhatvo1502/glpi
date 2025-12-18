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

su - ec2-user -c "cd /opt/glpi && git clone --sparse https://github.com/nhatvo1502/glpi.git ."
su - ec2-user -c "cd /opt/glpi && git sparse-checkout set docker"
su - ec2-user -c "cd /opt/glpi/docker && docker compose up -d"

cd /opt/glpi/docker

sudo docker compose up