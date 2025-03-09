
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

resource "proxmox_vm_qemu" "test1" {
  name        = "test1"
  target_node = "pve2"         # TODO: Change to your Proxmox node name
}
