resource "aws_instance" "platform" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.vm_web_instance_type

  key_name = var.key_name

  root_block_device {
    volume_type = var.vm_web_volume_type
    volume_size = 8
  }

  subnet_id                   = aws_subnet.develop.id
  associate_public_ip_address = true

  availability_zone = var.availability_zone

  tags = {
    Name    = var.vm_web_name
    Owner   = var.vm_web_owner
    Project = var.vm_web_project
  }

  vpc_security_group_ids = [
    aws_security_group.external_net.id,
    aws_security_group.internal_net.id,
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "netology-develop-platform-db" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.vm_web_instance_type_db

  key_name = var.key_name

  root_block_device {
    volume_type = var.vm_web_volume_type
    volume_size = 8
  }

  subnet_id                   = aws_subnet.develop.id
  associate_public_ip_address = true

  availability_zone = var.availability_zone

  tags = {
    Name    = var.vm_web_name
    Owner   = var.vm_web_owner
    Project = var.vm_web_project
  }

  vpc_security_group_ids = [
    aws_security_group.external_net.id,
    aws_security_group.internal_net.id,
  ]

  lifecycle {
    create_before_destroy = true
  }
}
