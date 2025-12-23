variable "vpc_id" {
    type = string
}

variable "subnet_id" {
    type = string
}

variable "ec2_instance_name" {
    default = "glpi"
    type = string
}

variable "ami" {
    default = "ami-0623300d1b7caee89"
    type = string
}

variable "instance_type" {
    default = "t3.medium"
    type = string
}

variable "volume_size" {
    default = 100
    type = number
}

variable "volume_type" {
    default = "gp3"
    type = string
}

variable "key_name" {
    type = string
    description = "Use existing EC2 Key Pair. If null, TF create a new one"
}

locals {
    use_existing_key = var.key_name != null
}