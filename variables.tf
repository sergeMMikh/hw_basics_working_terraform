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

