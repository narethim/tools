


terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
}

resource "libvirt_volume" "host5-qcow2" {
  name   = "host5-qcow2"
  pool   = "default"
  source = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
  format = "qcow2"
}

resource "libvirt_domain" "host5" {
  name   = "host5"
  memory = "2048"
  vcpu = 2

  network_interface {
    #network_name = "host-bridge"
    network_name = "default"
  }
  disk {
    volume_id ="${libvirt_volume.host5-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "vnc"
    listen_type = "address"
    listen_address ="0.0.0.0"
    autoport = true
  }
}
