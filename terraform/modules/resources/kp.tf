resource "tls_private_key" "local_private_key" {
  count = local.use_existing_key ? 0 : 1
  algorithm   = "RSA"
  rsa_bits = 4069
}

resource "aws_key_pair" "glpi_key" {
  count = local.use_existing_key ? 0 : 1
  key_name = "glpi_key"
  public_key = tls_private_key.local_private_key[0].public_key_openssh
}

resource "local_file" "ssh_key" {
  count = local.use_existing_key ? 0 : 1
  filename = "${aws_key_pair.glpi_key[0].key_name}.pem"
  content = tls_private_key.local_private_key[0].private_key_pem
  file_permission = "0400"
}

locals {
  effective_key_name = local.use_existing_key ? var.key_name : aws_key_pair.glpi_key[0].key_name
}