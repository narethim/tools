# Solaris

## Solaris 7

## References

* [Exploring Sun Solaris 7 for SPARC](https://www.youtube.com/watch?v=sJFxwBfFkyM)

* [Solaris 10 Basic Commands: Part 1](https://www.youtube.com/watch?v=b2Qn26DcIfI)

```sh
# permissions

ls -la

# Add w permission
chmod u+w file1

# Disk space in k bytes
df -k 

# Disk space in g bytes
df -h

# Physical Disk
format

p

# Add user and group
useradd user1
groupadd group1

# Look at `user1` in /etc/passwd 
cat /etc/passwd

# Look at `group1` in /etc/group 
cat /etc/group

# Delete user and group
userdel user1
groupdel group1

# process
ps -ef
ps -ef | grep cron

```

* [Solaris 10 Basic Commands: Part 2](https://www.youtube.com/watch?v=b2Qn26DcIfI)

```sh
# Check processor
psinfo 
psinfo -pv

# Check RAM
/sr/sbin/prtconf | head

# Check tcp ports
cat /etc/services
```

* [Solaris Tips: The AWK Command Made Simple](https://www.youtube.com/watch?v=sH1Aps6PRiI&list=PL2OVQweP-iGIzRaDU6yxrMxVB1sRCY6nm&index=4)

Create a scipt file `script1`

```sh
#!/binsh
cp /etc/passwd /tmp/passwd
cat /tmp/passwd | awk -F: '{print $1 }' > /tmp/userlist
sleep 5
cat /tmp/userlist
```

```sh
chmod u+x script1

./script1
```

* [Get online with Solaris 7 x86 (SUN OS 5.7) in 2023](https://www.youtube.com/watch?v=JQdqY_m1W5Q)

Step 1

Add your gateway address
`/etc/defaultrouter`

```sh
192.168.1.1
```

Step 2

Setup DNS NameServer addresses
`/etc/resolv.conf`

```sh
domain mydomain.net
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
