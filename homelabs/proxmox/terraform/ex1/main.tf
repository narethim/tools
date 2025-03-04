variable "cloudinit_template_name" {
    type = string 
}

variable "proxmox_node" {
    type = string
}

variable "ssh_key" {
  type = string 
  sensitive = true
}

#variable "vm_ip_base" {
#  description = "Base IP address (first 3 octets, e.g., '192.168.1.')"
#  type        = string
#  default     = "192.168.50."
#}

resource "proxmox_vm_qemu" "debian" {
  count = 2
  name = "k8s-1${count.index + 1}"
  target_node = var.proxmox_node
  clone = var.cloudinit_template_name
  #agent = 1
  os_type = "cloud-init"
  cores = 1
  sockets = 1
  #cpu = "cpu_type"
  memory = 2048
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disk {
    slot = "scsi0"
    size = "10G"
    type = "disk"
    storage = "zfs-disk7"
  }
  disk {
    slot    = "ide2"
    size    = "4M"
    type    = "cloudinit"
    storage = "zfs-disk7"
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }
  
  lifecycle {
    ignore_changes = [
      network, sshkeys
    ]
  }

  ciuser     = "nim"            # or your template's default user
  ipconfig0  = "ip=192.168.50.20${count.index + 1}/24,gw=192.168.50.1"
  nameserver = "8.8.8.8"
  sshkeys    = var.ssh_key
  
  automatic_reboot = true

  #sshkeys = <<EOF
  #${var.ssh_key}
  #EOF

}















