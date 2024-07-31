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

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "platform" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = var.key_name

  root_block_device {
    volume_type = "gp2"
    volume_size = 8
  }

  subnet_id                   = aws_subnet.develop.id
  associate_public_ip_address = true

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

  lifecycle {
    create_before_destroy = true
  }
}

