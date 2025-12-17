resource "tls_private_key" "local_private_key" {
  algorithm   = "RSA"
  rsa_bits = 4069
}

resource "aws_key_pair" "glpi_key" {
    key_name = "glpi_key"
    public_key = tls_private_key.local_private_key.public_key_openssh
}

resource "local_file" "ssh_key" {
    filename = "${aws_key_pair.glpi_key.key_name}.pem"
    content = tls_private_key.local_private_key.private_key_pem
    file_permission = "0400"
}