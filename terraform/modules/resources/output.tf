output "private_key" {
  value     = try(tls_private_key.local_private_key[0].private_key_pem, var.key_name)
  sensitive = true
}

output "public_ip" {
    value = aws_instance.glpi.public_ip
}