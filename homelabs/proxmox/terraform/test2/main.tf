
# Minimal configuration

terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
  required_version = ">= 1.2.0"
}

provider "proxmox" {
  pm_api_url          = "https://192.168.50.176:8006/api2/json" #  TODO: Proxmox host
  pm_api_token_id     = "root@pam!terraform"                    #  TODO: Get from Proxmox
  pm_api_token_secret = "xxxx"  #  TODO: Get from Proxmox
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "test2" {
  name        = "test2"
  target_node = "pve2"                # TODO: Change to your Proxmox node name
  clone       = "ubuntu2204-template" # TODO: Change to your template name

  cores  = 2
  memory = 2048
  scsihw = "virtio-scsi-pci" # Ensure correct SCSI controller

  disk {
    slot    = "scsi0"
    size    = "10G"
    type    = "disk"
    storage = "local-lvm"
  }
  disk {
    slot    = "ide2"
    size    = "4M"
    type    = "cloudinit"
    storage = "local-lvm"
  }
  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  os_type   = "cloud-init"
  ipconfig0 = "ip=192.168.50.90/24,gw=192.168.50.90"
  sshkeys   = "xxxx" # TODO: cat ~/.ssh/id_rsa.pub from terraform control VM machine

  ciuser       = "homelab"            # or your template's default user
  nameserver   = "8.8.8.8"            # google dns
  #searchdomain = "vermillion.local"  # local domain

  automatic_reboot = true

  lifecycle {
    ignore_changes = [network, sshkeys]
  }

}
