# Example 1

## Example 1: Terraform Infrastructure as Code for Proxmox

* [Youtube](https://www.youtube.com/watch?v=DjmzVHj3AK0) Engeneering with Morris
* [Github](https://github.com/morrismusumi/kubernetes/tree/main/iac)

## Example 1 Note: `Not working yet`

* Agent = 1 get stuck
* Instantiate but cannot access it from client. No route to it!

## Setup Instructions

### 1. Configure Terraform Variables

Create a `terraform.tfvars` file with your Proxmox credentials and settings:

```sh
pm_api_url = "https://192.168.50.178:8006/api2/json"
pm_api_token_id = "root@pam!myterraform"
pm_api_token_secret = "xxx"
cloudinit_template_name = "debian-11-cloudinit-template"
proxmox_node = "pve1"
ssh_key = "ssh-rsa xxx" # cat ~/.ssh/id_rsa.pub from terraform control VM machine
```

### 2. Initialize and Apply

```sh
terraform init

terraform plan

terraform apply -auto-approve
```

### 3. Verification

```sh
ssh homelab@192.168.50.201
ssh homelab@192.168.50.202
```

### 4. Cleanup

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
qm create 9003 --name "debian-11-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0

qm importdisk 9003 debian-11-generic-amd64.qcow2 zfs-disk7

qm set 9003 --scsihw virtio-scsi-pci --scsi0 zfs-disk7:vm-9003-disk-0

qm set 9003 --boot c --bootdisk scsi0

qm set 9003 --ide2 zfs-disk7:cloudinit
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
