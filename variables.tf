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

variable "vm_web_name" {
  type        = string
  description = "The image name"
  default     = "netology-develop-platform-web"
}

variable "vm_web_instance_type" {
  type        = string
  description = "The type of instance"
  default     = "t2.micro"
}

variable "vm_web_volume_type" {
  type        = string
  description = "The type disc"
  default     = "gp2"
}

variable "vm_web_owner" {
  type        = string
  description = "The type disc"
  default     = "SMMikh"
}

variable "vm_web_project" {
  type        = string
  description = "The type disc"
  default     = "hw_basics_working_terraform."
}



# ###cloud vars
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

# variable "cloud_id" {
#   type        = string
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
# }

# variable "folder_id" {
#   type        = string
#   description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
# }

# variable "default_zone" {
#   type        = string
#   default     = "ru-central1-a"
#   description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
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


# ###ssh vars

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "<your_ssh_ed25519_key>"
#   description = "ssh-keygen -t ed25519"
# }
