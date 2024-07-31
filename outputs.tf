# output "srv_public_ip" {
#   value = aws_instance.platform[0].public_ip
# }

# output "srv_public_dns" {
#   value = aws_instance.platform[0].public_dns
# }

# output "srv_private_ip" {
#   value = aws_instance.platform[0].private_ip
# }

output "srv_public_ip" {
  value = aws_instance.platform[0].public_ip
}

# output "srv_public_dns" {
#   value = aws_instance.platform[0].public_dns
# }

# output "srv_private_ip" {
#   value = aws_instance.platform[0].private_ip
# }

output "subnet_cidr_block" {
  value = aws_subnet.develop.cidr_block
}

output "instance_private_ip_in_subnet" {
  value = aws_instance.platform[0].private_ip
}

