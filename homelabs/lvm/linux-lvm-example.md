# Linux LVM example

Using pve3

```sh
ls -lsah /dev/disk/by-id
```

pvesm alloc local-lvm 104 '' 2G

```sh
root@pve3:~# pvesm alloc local-lvm 104 '' 2G
  Logical volume "vm-104-disk-0" created.
successfully created 'local-lvm:vm-104-disk-0'
```

qm set 104 --scsi11 local-lvm:vm-104-disk-0,discard=on

```sh
root@pve3:~# qm set 104 --scsi11 local-lvm:vm-104-disk-0,discard=on
update VM 104: -scsi11 local-lvm:vm-104-disk-0,discard=on
```

qm config 104 | grep scsi11

```sh
root@pve3:~# qm config 104 | grep scsi11
scsi11: local-lvm:vm-104-disk-0,discard=on,size=2G
```

------

pvesm alloc Dir01-3TB 104 '' 2G 

```sh
root@pve3:~# pvesm alloc Dir01-3TB 104 '' 2G
Formatting '/mnt/pve/Dir01-3TB/images/104/vm-104-disk-1.raw', fmt=raw size=2147483648 preallocation=off
successfully created 'Dir01-3TB:104/vm-104-disk-1.raw'
```

qm set 104 --scsi11 Dir01-3TB:vm-104-disk-1,discard=on
```sh
root@pve3:~# qm set 104 --scsi11 Dir01-3TB:vm-104-disk-1,discard=on
unable to parse directory volume name 'vm-104-disk-1'
```

```sh
root@pve3:~# pvesm alloc Dir01-3TB 104 '' 2G
Formatting '/mnt/pve/Dir01-3TB/images/104/vm-104-disk-2.raw', fmt=raw size=2147483648 preallocation=off
successfully created 'Dir01-3TB:104/vm-104-disk-2.raw'


root@pve3:~# qm set 104 --scsi11 Dir01-3TB:vm-104-disk-2,discard=on
unable to parse directory volume name 'vm-104-disk-2'
```