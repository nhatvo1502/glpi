resource "tls_private_key" "local_private_key" {
  algorithm   = "RSA"
  rsa_bits = 4069
}

resource "aws_key_pair" "glpi_key" {
    key_name = "glpi_key"
    public_key = tls_private_key.local_private_key.public_key_openssh
}