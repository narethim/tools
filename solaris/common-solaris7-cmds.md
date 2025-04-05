# Solaris 7

## Add a user

```sh
# become root user $ su root or login as root

# make a user3 directory in /export/home directory
mkdir /export/home/user3

# Add user3 with default home at /export/home/users
useradd -d /export/home/user3 -m user3

# change owner
chown user3 /export/home/user3

# verify login defaults
logins -x -l user3

# change user3 password
passwd user3
```

## References

* [Get online with Solaris 7 x86 (SUN OS 5.7) in 2023](https://www.youtube.com/watch?v=JQdqY_m1W5Q)

Step 1

Add your gateway address `/etc/defaultrouter`

```sh
192.168.1.1
```

Step 2

Setup DNS NameServer addresses `/etc/resolv.conf`

```sh
# domain mydomain.net
nameserver 8.8.8.8
nameserver 1.1.1.1
```

Step 3

Update `/etc/nsswitch.conf` to use the DNS information

```sh
hosts: dns [NOTFOUND=return] files
```

Step 4

```sh
reboot
```
