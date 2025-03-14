terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
}

resource "libvirt_domain" "test1" {
  name   = "test1"
}
