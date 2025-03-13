# Multiple VMs configuration

## Prerequisite

* Proxmox installed
* terraform install

## Run

```sh
terraform init

terraform plan

terraform apply
terraform apply -auto-approve

virsh list --all

terraform destroy
terraform destroy -auto-approve
```

## Connect from client

```sh
ssh homelab@192.168.50.95
```

It may not connect.

```sh
nim@debian:~/tools/homelabs/proxmox/terraform/test3$ ssh homelab@192.168.50.95
ssh: connect to host 192.168.50.95 port 22: Connection refused
```

Check for the following error:

```sh
nim@debian:~/tools/homelabs/proxmox/terraform/test3$ ssh homelab@192.168.50.95
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that a host key has just been changed.
The fingerprint for the ED25519 key sent by the remote host is
SHA256:i59Fr5BhdjOKtI/Vbd83H7JY6R9+e7fPZzIC4RuWlWk.
Please contact your system administrator.
Add correct host key in /home/nim/.ssh/known_hosts to get rid of this message.
Offending ECDSA key in /home/nim/.ssh/known_hosts:3
  remove with:
  ssh-keygen -f "/home/nim/.ssh/known_hosts" -R "192.168.50.95"
Host key for 192.168.50.95 has changed and you have requested strict checking.
Host key verification failed.
```

```sh
ssh-keygen -f "/home/nim/.ssh/known_hosts" -R "192.168.50.95"
```
