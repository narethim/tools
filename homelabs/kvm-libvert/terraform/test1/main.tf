
terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

# resource "libvirt_domain" "terraform_test" {
#   name = "terraform_test"
# }

resource "libvirt_domain" "domain-ubuntu" {
  name   = "ubuntu-terraform"
}

