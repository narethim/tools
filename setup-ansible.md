
# Set up Ansible

A quick and simple Ansibe setup:

* A control machine
* A remote machine

## Set up Ansible control machine

### Install

```sh
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

[Module Index](https://docs.ansible.com/ansible/latest/modules/modules_by_category.html)

* [Files module](https://docs.ansible.com/ansible/latest/modules/list_of_files_modules.html)
* [Commands module](https://docs.ansible.com/ansible/latest/modules/list_of_commands_modules.html)
