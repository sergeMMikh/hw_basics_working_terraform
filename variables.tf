variable "region" {
  type        = string
  description = "The instance region"
  sensitive   = true
}

variable "access_key" {
  type        = string
  description = "The access key"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  description = "The secret access key"
  sensitive   = true
}

variable "key_name" {
  type        = string
  description = "The Key pair name"
  sensitive   = true
}

variable "availability_zone" {
  description = "The AWS availability zone"
  type        = string
  default     = "eu-central-1a"
}

# variable "availability_zone_db" {
#   description = "The AWS availability zone"
#   type        = string
#   default     = "eu-central-1b"
# }

variable "default_cidr" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

# variable "subnet_cidr_a" {
#   type        = string
#   default     = "10.0.1.0/28"
#   description = "CIDR block for the subnet in eu-central-1a"
# }

# variable "subnet_cidr_b" {
#   type        = string
#   default     = "10.0.1.16/28"
#   description = "CIDR block for the subnet in eu-central-1b"
# }

# variable "availability_zone_a" {
#   type        = string
#   default     = "eu-central-1a"
#   description = "The AWS availability zone for the first instance"
# }

# variable "availability_zone_b" {
#   type        = string
#   default     = "eu-central-1b"
#   description = "The AWS availability zone for the second instance"
# }

# ###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "<your_ssh_ed25519_key>"
#   description = "ssh-keygen -t ed25519"
# }
