# resource "yandex_vpc_network" "develop" {
#   name = var.vpc_name
# }
# resource "yandex_vpc_subnet" "develop" {
#   name           = var.vpc_name
#   zone           = var.default_zone
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = var.default_cidr
# }

resource "aws_vpc" "develop" {
  cidr_block       = var.default_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "develop" {
  tags = {
    Name = var.vpc_name
  }

  vpc_id            = aws_vpc.develop.id
  cidr_block        = var.default_cidr
  availability_zone = var.availability_zone

}

# resource "aws_network_interface" "ptfom" {
#   subnet_id   = aws_subnet.develop.id
#   private_ips = ["10.0.1.10"]

#   tags = {
#     Name = "primary_network_interface"
#   }
# }

resource "aws_instance" "platform" {
  count         = 1
  ami           = "ami-0e872aee57663ae2d"
  instance_type = "t2.micro"

  key_name = var.key_name

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }

  availability_zone = var.availability_zone

  tags = {
    Name    = "netology-develop-platform-web"
    Owner   = "SMMikh"
    Project = "hw_basics_working_terraform."
  }

  vpc_security_group_ids = [
    aws_security_group.external_net.id,
    aws_security_group.internal_net.id,
  ]

  # network_interface {
  #   network_interface_id = aws_network_interface.ptfom.id
  #   device_index         = 0
  # }

  lifecycle {
    create_before_destroy = true
  }
}



# data "yandex_compute_image" "ubuntu" {
#   family = "ubuntu-2004-lts"
# }

# resource "yandex_compute_instance" "platform" {
#   name        = "netology-develop-platform-web"
#   platform_id = "standart-v4"
#   resources {
#     cores         = 1
#     memory        = 1
#     core_fraction = 5
#   }
#   boot_disk {
#     initialize_params {
#       image_id = data.yandex_compute_image.ubuntu.image_id
#     }
#   }
#   scheduling_policy {
#     preemptible = true
#   }
#   network_interface {
#     subnet_id = yandex_vpc_subnet.develop.id
#     nat       = true
#   }

#   metadata = {
#     serial-port-enable = 1
#     ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
#   }

# }
