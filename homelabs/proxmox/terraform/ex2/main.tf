resource "proxmox_vm_qemu" "ubuntu" {
  count       = var.vm_count
  name        = "${var.vm_name}-${count.index + 1}"
  target_node = "pve1"         # Change to your Proxmox node name
  clone       = "ubuntu2204-template" # Change to your template name

  cores  = var.vm_cores
  memory = var.vm_memory
  scsihw = "virtio-scsi-pci" # Ensure correct SCSI controller

  disk {
    slot    = "scsi0"
    size    = var.vm_disk_size
    type    = "disk"
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
    bridge = var.vm_network
  }

  os_type   = "cloud-init"
  ipconfig0 = "ip=${var.vm_ip_base}${count.index + var.vm_ip_start}/24,gw=${var.vm_gateway}"
  sshkeys   = var.ssh_key

  ciuser       = "homelab"            # or your template's default user
  nameserver   = "8.8.8.8"            # google dns
  #searchdomain = "vermillion.local"  # local domain

  automatic_reboot = true

  lifecycle {
    ignore_changes = [network, sshkeys]
  }
}
