# Install and setup NFS

## 1 Host (server) setup

Step 1 - Downloading and Installing the Components

```sh
sudo apt update
sudo apt install nfs-kernel-server
```

Step 2 - Creating the Share Directories on the Host

```sh
sudo mkdir /var/nfs/general -p

ls -la /var/nfs/general

sudo chown nobody:nogroup /var/nfs/general

```

Step 3 - Configuring the NFS Exports on the Host Server

```sh
sudo vi /etc/exports
```

Append the following lines to `/etc/exports` file

Replace host_ip with actual ip address: 192.168.0.xxx

```sh
/var/nfs/general    client_ip(rw,sync,no_subtree_check)
/home               client_ip(rw,sync,no_root_squash,no_subtree_check)
```

example:

```sh
/var/nfs/general    192.168.0.115(rw,sync,no_subtree_check)
/home               192.168.0.115(rw,sync,no_root_squash,no_subtree_check)
```

Restart service

```sh
# restart service
sudo systemctl restart nfs-kernel-server

# verify
sudo systemctl status nfs-kernel-server
```

Step 4 — Adjusting the Firewall on the Host (if activated)

```sh
sudo ufw status
```

## 2 Client setup

Step 1 - Downloading and Installing the Components

```sh
sudo apt update
sudo apt install nfs-common
```

Step 5 - Creating Mount Points and Mounting Directories on the Client

```sh
sudo mkdir -p /nfs/general
sudo mkdir -p /nfs/home
```

Replace host_ip with actual ip address: 192.168.0.xxx

```sh
sudo mount host_ip:/var/nfs/general /nfs/general
sudo mount host_ip:/home /nfs/home

df -h
```

Example:

```sh
sudo mount 192.168.0.180:/var/nfs/general /nfs/general
sudo mount 192.168.0.180:/home /nfs/home

df -h
```

Step 6 - Testing NFS Access

```sh
sudo touch /nfs/general/general.test

ls -l /nfs/general/general.test
```

Step 7 - Mounting the Remote NFS Directories at Boot

```sh
sudo vi /etc/fstab
```

At the bottom of the file, add a line for each of our shares. They will look like this:

Replace host_ip with actual ip address: 192.168.0.xxx

```sh
host_ip:/var/nfs/general    /nfs/general   nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
host_ip:/home               /nfs/home      nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
```

Example:

```sh
192.168.0.180:/var/nfs/general    /nfs/general   nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
192.168.0.180:/home               /nfs/home      nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
```

Step 8 - Unmounting an NFS Remote Share

```sh
cd ~
sudo umount /nfs/home
sudo umount /nfs/general

# verify
df -h
```

## 3 References

* [How To Set Up an NFS Mount on Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-nfs-mount-on-ubuntu-20-04)
