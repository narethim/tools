# Solaris 10 common commands

## References

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
