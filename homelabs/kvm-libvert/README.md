# KVM -libvert

## Installation

* [KVM setup](https://low-orbit.net/kvm-lab-setup) by low-orbit
* [How Do I Properly Install KVM on Linux](https://sysguides.com/install-kvm-on-linux) by SysGuide

## Instructions

### 1. KVM - CPU / Hardware support

Check for CPU virtualization support ( Intel VT-x or AMD-V ):

```sh
egrep -c '(vmx|svm)' /proc/cpuinfo

0          # cpu doesn't support hardware virtualization
1 or more  # cpu does support hardware virtualization ( still needs to be enabled in bios )
```

Also check if it is enabled with this:

```sh
sudo apt update
sudo apt install cpu-checker     # probably already installed

kvm-ok
```

### 2. KVM and libvirt Setup

Install important virtualization packages:

```sh
sudo apt -y install bridge-utils cpu-checker libvirt-clients \
libvirt-daemon virt-manager virtinst qemu qemu-kvm
```

Make sure libvirtd is active:

```sh
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo systemctl is-active libvirtd
```

Give my non-root user permissions to work with virtualization tools:

```sh
sudo usermod -aG libvirt $USER
sudo usermod -aG kvm $USER
```

|  Location               | Description |
| ----------------------- | ----------- |
| /var/lib/libvirt/       | libvirtd files kept here |
| /var/lib/libvirt/images | images kept here |
| /var/lib/libvirt/isos   | can create this for ISOs (non-standard but good idea) |

### 3. Creating and Cloning VMs

Pull down an OS install ISO:

```sh
sudo wget -P /var/lib/libvirt/isos \
https://releases.ubuntu.com/22.04.3/ubuntu-22.04.3-live-server-amd64.iso
```

VMs can be created using the virt-manager GUI or the virt-install CLI tool.

Create a VM using virt-install:

```sh
sudo virt-install \
--name host1 \
--ram=2048 \
--disk size=10 \
--vcpus 1 \
--os-variant ubuntu22.04 \
--cdrom /var/lib/libvirt/isos/ubuntu-22.04.3-live-server-amd64.iso
```

Pure text based console installation ( no graphical VNC or SPICE ).

Remote installation media can be specified with ‘–location’ and will need to be used because ‘cdrom’ is not compatible with –extra-args=’console=ttyS0’

```sh
sudo virt-install \
--name host2 \
--ram=2048 \
--disk size=10 \
--vcpus 1 \
--os-type linux --os-variant ubuntu22.04 \
--location 'http://archive.ubuntu.com/ubuntu/dists/bionic/main/installer-amd64/' \
--nographics \
--extra-args='console=ttyS0'
```

```sh
virsh list --all
virsh domifaddr host1
ssh 192.168.122.166
```

Configure guest system to work with console after installation:


```sh
sudo vi /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash console=ttyS0"

sudo update-grub
sudo reboot
virsh console host1

ctrl - ]     # to exit
```

More options:

```sh
....
--disk path=/var/lib/libvirt/images/u19.qcow2,size=8 \
--location 'http://archive.ubuntu.com/ubuntu/dists/focal/main/installer-amd64/'
--extra-args "console=tty0 console=ttyS0,115200n8"
--extra-args='console=ttyS0,115200n8 serial'
--console pty,target_type=serial \
--network bridge=virbr0,model=virtio
--graphics none
--os-variant generic
...
```

Clone a VM:

```sh
virt-clone \
--original host1 \
--name host2 \
--file /var/lib/libvirt/images/host2.qcow2
```

List all:

```sh
virsh list --all
```

Serial Console:

```sh
virsh ttyconsole my_vm
 

virsh domifaddr vm1 # get ip address
ssh-copy-id rkamradt@192.168.122.95 # use ip address from previous step
 

virsh domifaddr node1
```

Libvirt URIs ( which hypervisor to connect to ):

```sh
qemu:///system	system libvirtd instance ( default for virt-manager, Openstack, oVirt )
qemu:///session	session libvirtd instance ( default for virsh, gnome-boxes, libguestfs )
```

When not logged in as root virsh may default to using qemu:///session which may be different from virt-manager.

Specify the system URI:

```sh
virsh --connect qemu:///system create host1.xml
```

Create a user specific config which can be used to point virsh to qemu:///system:

```sh
sudo cp -rv /etc/libvirt/libvirt.conf ~/.config/libvirt/ &&\
sudo chown ${USER}:${USER} ~/.config/libvirt/libvirt.conf
```

### 4. Commands / Operations
