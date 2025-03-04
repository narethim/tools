output "vm_ips" {
  value = proxmox_vm_qemu.debian[*].default_ipv4_address
}