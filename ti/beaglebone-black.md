# BeagleBone Black

## Login

1 Login as `root`. There is no password needed

```sh
login as: root
```

2 Login as `debian`. The default password is `temppwd`

```sh
login as: debian
password: temppwd
```

## Setup

### Setup TightVNC

```bash
# login as root

apt-get install tightvncserver

# Configure vncserver for the first time 
vncserver

# setup password
vncpwd

# start vncserver
vncserver :1 -geometry 1280x1024 -depth 24 -dpi 96
```

### VNCViewer from PC

* Install VNC Viewer

### Some usefull commands

```sh

sudo shutdown -h 0
```

Check version

```sh
cat /etc/dogtag
BeagleBoard.org Debian Image 2016-05-13

uname -a
Linux beaglebone 4.4.9-ti-r25 #1 SMP Thu May 5 23:08:13 UTC 2016 armv7l GNU/Linux

lsb_release -a
lsb_release -d

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

* [BeagleBone Black Lessons - Playlist](https://www.youtube.com/playlist?list=PLGs0VKk2DiYyThNvj6VyDFmOnQ8ncXk8b) 17 videos by Paul McWhorter

### Misc

* Linux Serial terminal [5 Linux / Unix Commands For Connecting To The Serial Console](https://www.cyberciti.biz/hardware/5-linux-unix-commands-for-connecting-to-the-serial-console/)

## Tips

```sh
dmesg | egrep -i --color 'serial|ttyS'
```

Using `cu` command to connect

```sh
cu -l /dev/ttyS0 -s 115200
```

To exit enter tilde dot (~.).

## Flash eMCC

* Wiki page [Beagleboard:BeagleBoneBlack Debian](https://elinux.org/Beagleboard:BeagleBoneBlack_Debian#Flashing_eMMC)