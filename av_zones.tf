# Get defoult VPC sidr-block
data "aws_vpc" "default" {
  default = true
}

data "aws_availability_zones" "available" {}

resource "aws_default_subnet" "primary" {
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "Default subnet primary"
  }
}

resource "aws_default_subnet" "secondary" {
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "Default subnet secondary"
  }
}
