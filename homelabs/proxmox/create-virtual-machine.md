# Create Virtual Machine

## Prerequisite

* set hostname

## pve1 Create Virtual Machine

### Upload iso image

```sh
pve1 > local (pve1) > ISO Images
Click on Upload
```

### Create Virtual Machine using the image

```sh
Right-click on pve1
Select Create VM
```

## Install `qemu-guest-agent` on Virtual Machine

```sh
sudo apt install qemu-guest-agent

sudo shutdown now
```
