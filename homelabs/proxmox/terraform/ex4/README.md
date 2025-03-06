# Example 4

## Example 4: How to create a Proxmox Ubuntu cloud-init image

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
ssh user@192.168.50.201
ssh user@192.168.50.202
```

### 4. Cleanup

```sh
terraform destroy -auto-approve
```

## Template Creation Guide

### Creating an Ubuntu-Server Template with Cloud-Init

#### 1. Download Ubuntu cloud image:

```sh
wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img
```

Then install qemu-guest-agent into the newly downloaded image:

```sh
sudo virt-customize -a focal-server-cloudimg-amd64.img --install qemu-guest-agent
```

#### 2. Create and configure VM template

```sh
sudo qm create 9006 --name "ubuntu-2004-cloudinit-template" --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
sudo qm importdisk 9006 focal-server-cloudimg-amd64.img zfs-disk7
sudo qm set 9006 --scsihw virtio-scsi-pci --scsi0 zfs-disk7:vm-9006-disk-0
sudo qm set 9006 --boot c --bootdisk scsi0
sudo qm set 9006 --ide2 zfs-disk7:cloudinit
sudo qm set 9006 --serial0 socket --vga serial0
sudo qm set 9006 --agent enabled=1
```

#### 3. Configure cloud-init

```sh
qm set 9006 --ipconfig0 ip=dhcp

qm set 9006 --sshkeys ~/.ssh/id_rsa.pub  # Your SSH key for access
```

#### 4. Convert to template

```sh
qm template 9006
```
