provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}


# terraform {
#   required_providers {
#     yandex = {
#       source = "yandex-cloud/yandex"
#     }
#   }
#   required_version = ">=1.5"
# }

# provider "yandex" {
#   # token     = var.token
#   cloud_id                 = var.cloud_id
#   folder_id                = var.folder_id
#   zone                     = var.default_zone
#   service_account_key_file = file("~/.authorized_key.json")
# }
