# Ubuntu Server 20.04, ZFS, and Samba

* [https://www.youtube.com/watch?v=G8btpRDLiTY](https://www.youtube.com/watch?v=G8btpRDLiTY)

## Steps

Ubuntu-24-04-server-LTS-zfs

### Create virtual disk using VirtualBox sdb sdc sdd sde

On Ubuntu-24-04-server-LTS-zfs VM install ZFS and Samba

```sh
sudo apt install zfsutils-linux samba

lsblk
```

```sh
ls -lh /dev/disk/by-id

lrwxrwxrwx 1 root root  9 Feb  8 21:18 scsi-SATA_VBOX_HARDDISK_VB37d9fb0a-7ed0b420 -> ../../sdb
lrwxrwxrwx 1 root root  9 Feb  8 21:18 scsi-1ATA_VBOX_HARDDISK_VBf6c15206-2f26811e -> ../../sdc
lrwxrwxrwx 1 root root  9 Feb  8 21:18 scsi-SATA_VBOX_HARDDISK_VBb343cb3c-f17bb23f -> ../../sdd
lrwxrwxrwx 1 root root  9 Feb  8 21:18 scsi-SATA_VBOX_HARDDISK_VB2203dc8f-cef693f1 -> ../../sde
```

#### Create zpool

```sh
sudo zpool create -f -m /mnt/data pool01 \
raidz \
scsi-SATA_VBOX_HARDDISK_VB37d9fb0a-7ed0b420 \
scsi-1ATA_VBOX_HARDDISK_VBf6c15206-2f26811e \
scsi-SATA_VBOX_HARDDISK_VBb343cb3c-f17bb23f \
scsi-SATA_VBOX_HARDDISK_VB2203dc8f-cef693f1
```

zpool status

```sh
sudo zpool status -v pool01
sudo zpool status
```

#### Destroy zpool

```sh
sudo zpool destroy pool01
```

## Create mirror pools

```sh
sudo zpool create -f -m /mnt/data pool02 \
mirror \
scsi-SATA_VBOX_HARDDISK_VB37d9fb0a-7ed0b420 \
scsi-1ATA_VBOX_HARDDISK_VBf6c15206-2f26811e \
mirror \
scsi-SATA_VBOX_HARDDISK_VBb343cb3c-f17bb23f \
scsi-SATA_VBOX_HARDDISK_VB2203dc8f-cef693f1
```

## rename

```sh
sudo zpool export pool02
sudo zpool import pool02 pool01

sudo zpool status -V
```

## Create a dataset

```sh
sudo zfs create pool01/dset01
```

## Create share

```sh
sudo zfs set sharesmb=on pool01/dset01

sudo chown -R nim:nim /mnt/data

sudo smbpasswd -a nim
```

New SMB password: smbnim789

Map

\\\\192.168.50.4\pool_dset01

### Cleanup

```sh
sudo zfs set sharesmb=off pool01/dset01
```

## Destroy a dataset

```sh
sudo zfs destroy pool01/dset01
```

Verify:

```sh
df -h
```

## Destroy pool

```sh
sudo zpool destroy pool01
```

Verify:
```sh
df -h
```
