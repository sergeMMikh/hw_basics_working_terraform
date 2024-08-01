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

# resource "aws_subnet" "develop_a" {
#   vpc_id            = aws_vpc.develop.id
#   cidr_block        = var.subnet_cidr_a
#   availability_zone = var.availability_zone_a

#   tags = {
#     Name = "${var.vpc_name}-a"
#   }
# }

# resource "aws_subnet" "develop_b" {
#   vpc_id            = aws_vpc.develop.id
#   cidr_block        = var.subnet_cidr_b
#   availability_zone = var.availability_zone_b

#   tags = {
#     Name = "${var.vpc_name}-b"
#   }
# }
