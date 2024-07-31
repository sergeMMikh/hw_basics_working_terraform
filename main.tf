# resource "yandex_vpc_network" "develop" {
#   name = var.vpc_name
# }
# resource "yandex_vpc_subnet" "develop" {
#   name           = var.vpc_name
#   zone           = var.default_zone
#   network_id     = yandex_vpc_network.develop.id
#   v4_cidr_blocks = var.default_cidr
# }

resource "aws_vpc" "main" {
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

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.default_cidr
  availability_zone = var.availability_zone

}

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
    aws_security_group.external_net.id
  ]

  # network_interface {
  #   subnet_id         = aws_subnet.develop.id
  #   associate_public_ip_address = true
  # }
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
