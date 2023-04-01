# Raspbeer Pi

## Login

Login as `pi`. The default password is `raspberry`

```sh
login as: pi
password: raspberry
```

## Setup

### Setup RealVNC server

```bash
# setup password
vncpwd

# start vncserver
vncserver :1 -geometry 1280x1024 -depth 24 -dpi 96
```

### RealVNC Viewer from PC

* Install VNC Viewer

### Some usefull commands

```sh
# Check disk space
df -h

pi@pi-master:~ $ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        15G  3.8G  9.8G  28% /
devtmpfs        459M     0  459M   0% /dev
tmpfs           464M     0  464M   0% /dev/shm
tmpfs           464M   13M  451M   3% /run
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           464M     0  464M   0% /sys/fs/cgroup
/dev/mmcblk0p1   43M   23M   20M  53% /boot
tmpfs            93M     0   93M   0% /run/user/1000

# Shutdown
sudo shutdown -h 0
```

Check version

```sh

uname -a
Linux pi-master 4.19.66-v7+ #1253 SMP Thu Aug 15 11:49:46 BST 2019 armv7l GNU/Linux

lsb_release -a
lsb_release -d

pi@pi-master:~ $ lsb_release -d
Description:	Raspbian GNU/Linux 9.13 (stretch)

hostnamectl

cat /etc/os-release
```

Useful tools

```sh
top

htop
```

## References

### YouTube


### Misc


## Tips

```sh
dmesg | egrep -i --color 'serial|ttyS'
```

Using `cu` command to connect

```sh
cu -l /dev/ttyS0 -s 115200
```

To exit enter tilde dot (~.).

