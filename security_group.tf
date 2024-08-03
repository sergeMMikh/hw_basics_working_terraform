resource "aws_security_group" "external_net" {
  name        = "HW External Sequrity Group"
  description = "allow ssh on 22 & http on port 80 & http on port 443"

  ## This is an internal network identification. It is not needed for now.
  ## Without this part, AWS uses a default internal network.
  # vpc_id = aws_vpc.develop.id
  vpc_id = data.aws_vpc.default.id

  # Incoming trafic
  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Out trafic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "HW External Sequrity Group"
    Owner   = var.vm_web_owner
    Project = var.vm_web_project
  }
}

resource "aws_security_group" "internal_net" {
  name        = "HW Internal Sequrity Group"
  description = "allow ssh on 22 & http on port 80 & http on port 443"

  ## This is an internal network identification. It is not needed for now.
  ## Without this part, AWS uses a default internal network.
  vpc_id = data.aws_vpc.default.id
  # Incoming trafic
  dynamic "ingress" {
    for_each = ["80", "443", "22"]
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [data.aws_vpc.default.cidr_block]
    }
  }

  # Outgoing traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [data.aws_vpc.default.cidr_block]
  }

  tags = {
    Name    = "HW Internal connections"
    Owner   = var.vm_web_owner
    Project = var.vm_web_project
  }

  # vpc_id = aws_vpc.develop.id
}

resource "aws_internet_gateway" "develop" {
  vpc_id = aws_vpc.develop.id

  tags = {
    Name = "develop"
  }
}
