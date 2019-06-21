
# Set up Ansible

A quick and simple Ansibe setup:

* A control machine
* A remote machine

## Set up Ansible control machine

### Install ansible on Ubuntu 18.04

Latest Releases via Apt (Ubuntu)

```sh
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

Verify

```sh
ansible --version
```

To set up ssh agent to avoid retyping password. Do the following:

```sh
# Start ssh agent
ssh-agent bash

# Add key to agent
ssh-add ~/.ssh/id_rsa
```

Copy ssh-id to target machines

```sh
# copy id to local target machines
ssh-copy-id ubuntu@localhost

# copy id to target machines
ssh-copy-id ubuntu@192.168.0.126
ssh-copy-id ubuntu@192.168.0.205
```

Add remote systems to `/etc/ansible/hosts`

```sh
vi /etc/ansible/hosts
```

Copy the following samples into the file.

```sh
192.168.0.123
192.168.0.124
server.name
```

Test it

```sh
# Ping
ansible all -m ping

# Ad-hoc command
ansible all -a date
```

## Set up Ansible remote systems

Setup remote systems.

### Prerequisite

1. openssh-server
2. python
3. sudo NOPASSWD:

```sh
# Install openssh-server
sudo apt-get install openssh-server -y

# Install python
sudo apt-get install python -y
```

## Ansible References

[Documentation](https://docs.ansible.com/ansible/latest/index.html)

[Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/index.html)

[User Guide](https://docs.ansible.com/ansible/latest/user_guide/index.html)



### Frequently used Ansible modules

Clustering modules

* [k8s – Manage Kubernetes (K8s) objects](https://docs.ansible.com/ansible/latest/modules/k8s_module.html#k8s-module)
* [k8s_facts – Describe Kubernetes (K8s) objects](https://docs.ansible.com/ansible/latest/modules/k8s_facts_module.html#k8s-facts-module)
* [k8s_service – Manage Services on Kubernetes](https://docs.ansible.com/ansible/latest/modules/k8s_service_module.html#k8s-service-module)

Commands module

* [command – Execute commands on targets](https://docs.ansible.com/ansible/latest/modules/command_module.html#command-module)
* [script – Runs a local script on a remote node after transferring it](https://docs.ansible.com/ansible/latest/modules/script_module.html#script-module)
* [shell – Execute shell commands on targets](https://docs.ansible.com/ansible/latest/modules/shell_module.html#shell-module)

File modules

* [copy – Copy files to remote locations](https://docs.ansible.com/ansible/latest/modules/copy_module.html#copy-module)
* [fetch – Fetch files from remote nodes](https://docs.ansible.com/ansible/latest/modules/fetch_module.html#fetch-module)
* [file – Manage files and file properties](https://docs.ansible.com/ansible/latest/modules/file_module.html#file-module)

Monitoring modules

* [grafana_plugin – Manage Grafana plugins via grafana-cli](https://docs.ansible.com/ansible/latest/modules/grafana_plugin_module.html#grafana-plugin-module)

Net Tools modules

* [get_url – Downloads files from HTTP, HTTPS, or FTP to node](https://docs.ansible.com/ansible/latest/modules/get_url_module.html#get-url-module)

Notification modules

* [mail – Send an email](https://docs.ansible.com/ansible/latest/modules/mail_module.html#mail-module)

Packaging modules

* [apt – Manages apt-packages](https://docs.ansible.com/ansible/latest/modules/apt_module.html#apt-module)
* [yum – Manages packages with the yum package manager](https://docs.ansible.com/ansible/latest/modules/yum_module.html#yum-module)

Source Control modules

* [git – Deploy software (or files) from git checkouts](https://docs.ansible.com/ansible/latest/modules/git_module.html#git-module)


System modules

* [modprobe – Load or unload kernel modules](https://docs.ansible.com/ansible/latest/modules/modprobe_module.html#modprobe-module)
* [ping – Try to connect to host, verify a usable python and return pong on success](https://docs.ansible.com/ansible/latest/modules/ping_module.html#ping-module)
* [service – Manage services](https://docs.ansible.com/ansible/latest/modules/service_module.html#service-module)
* [setup – Gathers facts about remote hosts](https://docs.ansible.com/ansible/latest/modules/setup_module.html#setup-module)
* [systemd – Manage services](https://docs.ansible.com/ansible/latest/modules/systemd_module.html#systemd-module)
* [user – Manage user accounts](https://docs.ansible.com/ansible/latest/modules/user_module.html#user-module)

Utilities modules
* [debug – Print statements during execution](https://docs.ansible.com/ansible/latest/modules/debug_module.html#debug-module)