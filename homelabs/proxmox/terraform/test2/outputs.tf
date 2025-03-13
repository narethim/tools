output "vm_ips" {
  value = proxmox_vm_qemu.test2.default_ipv4_address
}