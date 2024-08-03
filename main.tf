resource "aws_instance" "platform" {
  count         = 1
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.vm_web_instance_type

  key_name = var.key_name

  root_block_device {
    volume_type = var.vm_web_volume_type
    volume_size = 8
  }

  subnet_id                   = aws_default_subnet.primary.id
  associate_public_ip_address = true

  availability_zone = data.aws_availability_zones.available.names[0]

  tags = merge(
    var.vms_resources["web"],
    var.metadata,
    { full_project_description = local.full_project_description }
  )

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

  subnet_id                   = aws_default_subnet.secondary.id
  associate_public_ip_address = true

  availability_zone = data.aws_availability_zones.available.names[1]

  tags = merge(
    var.vms_resources["db"],
    var.metadata,
    { full_project_description = local.full_project_description }
  )

  vpc_security_group_ids = [
    aws_security_group.external_net.id,
    aws_security_group.internal_net.id,
  ]

  lifecycle {
    create_before_destroy = true
  }
}
