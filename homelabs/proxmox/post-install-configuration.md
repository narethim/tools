# Post install configuration

Configure promox node after installation.

## Update `Proxmox` without a subscription

Append the following line to file: `/etc/apt/sources.list`

```sh
# not for production use
deb http://download.proxmox.com/debian buster pve-no-subscription
```

Edit file: `/etc/apt/sources.list.d/pve-enterprise.list`. Comment out the following line:

```sh
# deb https://enterprise.proxmox.com/debian/pve buster pve-enterprise
```

Update the repository and dist-upgrade

```sh
apt-get update

apt dist-upgrade
```

Reboot the system

```sh
reboot
```
