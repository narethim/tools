terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
    }
  }
}

provider "libvirt" {
  # Configuration options
  uri = "qemu:///system"
}

resource "libvirt_volume" "host6-qcow2" {
  name = "host6-qcow2"
  pool = "default"
  #source = "/var/lib/libvirt/images/ubuntu_server_bionic_console_enabled.qcow2"
  source = "https://cloud-images.ubuntu.com/releases/xenial/release/ubuntu-16.04-server-cloudimg-amd64-disk1.img"
  format = "qcow2"
}

resource "libvirt_domain" "host6" {
  name = "host6"
  memory = "2048"
  vcpu = 2

  network_interface {
    #network_name = "host-bridge"
    # network_name = "br0"
    #network_name = "virbr0"
    network_name = "default"
  }

  disk {
    volume_id = "${libvirt_volume.host6-qcow2.id}"
  }

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "vnc"
    listen_type = "address"
    listen_address = "0.0.0.0"
    autoport = true
  }
}
