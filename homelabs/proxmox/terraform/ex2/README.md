# Example 2

## Example 2: Proxmox+Terraform (Homelab Dad)

* [Youtube](https://www.youtube.com/watch?v=LkWoGeQAu4E)
* [Github](https://github.com/HomelabDad/proxmox-terraform-base/tree/main/terraform)

## Setup Instructions

### 1. Confugure Terraform Variables

Create a `terraform.tfvars` file with your Proxmox credentials and settings:

```sh
roxmox_api_url  = "https://192.168.50.178:8006/api2/json"
vm_name          = "homelab800-vm"
vm_memory        = 4096
vm_cores         = 2
vm_disk_size     = "20G"
vm_network       = "vmbr0"
proxmox_api_token_id = "root@pam!myterraform"
proxmox_api_token_secret = "xxx"
vm_ip_base = "192.168.50."
vm_ip_start = 90
vm_gateway = "192.168.50.1"
ssh_key = "ssh-rsa " # cat ~/.ssh/id_rsa.pub from terraform control VM machine
```

### 2. Initialize and Apply

```sh
terraform init

terraform plan

terraform apply -auto-approve
```

### 3. Cleanup

```sh
terraform destroy -auto-approve
```

## Template Creation Guide

### Creating an Ubuntu-Server Template with Cloud-Init

#### 1. Download Ubuntu cloud image:

```sh
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
```

#### 2. Create and configure VM template

```sh
qm create 8000 --name "ubuntu2204-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
qm importdisk 8000 jammy-server-cloudimg-amd64.img zfs-disk7
qm set 8000 --scsihw virtio-scsi-pci --scsi0 zfs-disk7:vm-8000-disk-0
qm set 8000 --ide2 zfs-disk7:cloudinit
qm set 8000 --boot c --bootdisk scsi0
qm set 8000 --serial0 socket --vga serial0
```

#### 3. Configure cloud-init

```sh
qm set 8000 --ipconfig0 ip=dhcp
qm set 8000 --sshkeys ~/.ssh/id_rsa.pub  # Your SSH key for access
```

#### 4. Convert to template

```sh
qm template 8000
```
