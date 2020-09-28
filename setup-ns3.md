# Setup NS-3 using Ansible

Install and build ns-3 version 3.29 using ansible

## 1. Pre-requisite

* Ansible is installed on Ansible controller machine

## 2. Install

### 2.1 Configure ansible

Create `ns3-host.ini`

```sh
cd ~/projects/tools/ansible

vim ns3-host.ini
```

Enter the following

```sh
[web]
192.168.0.124

[web:vars]
ansible_ssh_user=nim
```

Change `ansible.cfg`

```sh
cd ~/projects/tools/ansible

vim ansible.cfg
```

Enter the following

```sh
[defaults]
inventory = ns3-host.ini
```

### 2.2 Test connection to `ns3-machine`

```sh
cd ~/projects/tools/ansible

ansible-playbook playbook/pb-test-connection2.yml
```

### 2.3 Install and build ns-3 on `ns-3 machine`

```sh
# Add the necessary packages for ns-3
ansible-playbook playbooks/pb-ns3-prerequisite.yml

# Install and build
ansible-playbook playbooks/pb-ns3-install.yml

# Test it by running hello-simulator
ansible-playbook playbooks/pb-ns3-run-test-apps.yml
```
