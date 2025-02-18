# Virtual Disks in Linux

* [https://discussion.scottibyte.com/t/virtual-disks-in-linux/118](https://discussion.scottibyte.com/t/virtual-disks-in-linux/118)
* [Virtual Disks in Linux](https://www.youtube.com/watch?v=DBqDHX9TtCA) YouTube

When we think of virtual disks, vdi’s, vhd’s and vmdk’s come to mind in the case of Virtualbox or qcow2 disk images which are used for QEMU virtual disks. Virtual disks are thought to only support virtual machines, but virtual disks can be used in Linux in many ways.

Loop device = a pseudo or virtual disk that makes a file accessible as a block based storage device.

## create a virtual disk in a file

Here are the commands I used to create a virtual disk in a file and to mount it and make it accessible by my user account:

```sh
sudo dd if=/dev/zero of=/media/vdisk.img bs=1M count=1024
sudo mkfs -t ext4 /media/vdisk.img
sudo mkdir /mnt/vdisk
sudo mount -t auto -o loop /media/vdisk.img /mnt/vdisk
sudo chown scott:scott /mnt/vdisk
```

To access the new disk:

```sh
cd /mnt/vdisk
```

To unmount the disk:

```sh
sudo umount /mnt/vdisk
```

A reboot does not mount a file system automatically. To make our file system mount automatically at boot time:

```sh
sudo nano /etc/fstab
```

Add the following line into the file:

/media/vdisk.img /mnt/vdisk ext4 defaults 0 0

Save the file and exit.

## Illustrate mounting an ISO disk image ---

To illustrate mounting an ISO disk image, I downloaded the Ubuntu desktop installation media as an ISO from the Ubuntu website and moved it to my /media folder.

To mount a CD or DVD ISO image:

```sh
sudo mkdir /mnt/ubuntu-dvd
sudo mount -o loop /media/ubuntu-22.04-desktop-amd64.iso /mnt/ubuntu-dvd
```

To access the read-only ISO:

```sh
cd /mnt/ubuntu-dvd
```

To unmount the DVD:

```sh
sudo umount /mnt/ubuntu-dvd
```

## ZFS Storage Pools ---

ZFS Storage Pools

ZFS performs a “copy on write” when data is to be changed unlike typical file systems which just overwrite data. This means that new information is written to different locations on the disk and once the “write” is complete, the metadata is updated to point to the new data. This makes zfs a file system that is unlikely to experience corruption in the case of OS crashes or power outages.

To use zfs, first check to see if zfs is supported by your kernel:

```sh
sudo modprobe zfs
```

If this command returns nothing, you are good. If not, zfs needs to be compiled into your Linux kernel which is beyond the scope of this tutorial.

Assuming you have zfs support, install the zfs utilities:

```sh
sudo apt install zfsutils-linux
```

Create a blank file to host your zfs pool. This is similar to what “lxd init” does when it creates a zfs storage pool for containers.

```sh
sudo truncate -s 1G /media/vzfspool.img
```

Create the zfs pool which creates a mount point, formats the pool inside the file and mounts it:

```sh
sudo zpool create mypool /media/vzfspool.img
```

By default, it will mount in “/mypool” and you will have to set desired ownership for access:

```sh
sudo chown scott:scott /mypool
```

If you want to change the mountpoint:

```sh
sudo mkdir /mnt/vzfspool
sudo zfs set mountpoint=/mnt/vzfspool mypool
```sh

To destroy your zfs pool and delete all the data:

```sh
sudo zpool destroy mypool
```

Other commands:

```sh
sudo zpool list
sudo zfs get all
sudo umount mypool
sudo zfs mount mypool
```

As a reminder, zfs pools normally do not need to be dismounted and they automatically mount at boot time and there is no need for a /etc/fstab entry.
