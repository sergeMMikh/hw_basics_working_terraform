##Этот файл для 7 задания!!
locals {

  test_list = ["develop", "staging", "production"]

  test_map = {
    admin = "John"
    user  = "Alex"
  }

  servers = {
    develop = {
      cpu   = 2
      ram   = 4
      image = "ubuntu-21-10"
      disks = ["vda", "vdb"]
    },
    stage = {
      cpu   = 4
      ram   = 8
      image = "ubuntu-20-04"
      disks = ["vda", "vdb"]
    },
    production = {
      cpu   = 10
      ram   = 40
      image = "ubuntu-20-04"
      disks = ["vda", "vdb", "vdc", "vdd"]
    }
  }
}


locals {
  dev1_ssh_command  = var.test[0]["dev1"][0]
  dev2_internal_ip  = var.test[1]["dev2"][1]
  prod1_ssh_command = var.test[2]["prod1"][0]
}

output "dev1_ssh_command" {
  value = local.dev1_ssh_command
}

output "dev2_internal_ip" {
  value = local.dev2_internal_ip
}

output "prod1_ssh_command" {
  value = local.prod1_ssh_command
}
