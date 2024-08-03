# output "srv_public_ip" {
#   value = aws_instance.platform[0].public_ip
# }

# output "instance_private_ip_in_subnet" {
#   value = aws_instance.platform[0].private_ip
# }

# output "srv_public_dns" {
#   value = aws_instance.platform[0].public_dns
# }

# output "srv_availability_zone" {
#   value = aws_instance.platform[0].availability_zone
# }

# output "db_public_ip" {
#   value = aws_instance.netology-develop-platform-db[0].public_ip
# }

# output "db_private_ip_in_subnet" {
#   value = aws_instance.netology-develop-platform-db[0].private_ip
# }

# output "db_public_dns" {
#   value = aws_instance.netology-develop-platform-db[0].public_dns
# }

# output "db_availability_zone" {
#   value = aws_instance.netology-develop-platform-db[0].availability_zone
# }

output "instances_info" {
  description = "Information about each instance"
  value = {
    web_instance = {
      # instance_name = aws_instance.platform[0].tags["Name"]
      external_ip = aws_instance.platform[0].public_ip
      fqdn        = aws_instance.platform[0].public_dns
    }
    db_instance = {
      # instance_name = aws_instance.netology-develop-platform-db[0].tags["Name"]
      external_ip = aws_instance.netology-develop-platform-db[0].public_ip
      fqdn        = aws_instance.netology-develop-platform-db[0].public_dns
    }
  }
}

output "full_project_description" {
  description = "Full project description including project name and owner"
  value       = local.full_project_description
}
