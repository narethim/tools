# Ansible playbook usage

## Prerequisite

* Ansible is installed

## Edit `inventory` file to match the remote systems

```sh
vi inventory
```

## Run playbooks to install

```sh
mkdir $USER/projects
cd $USER/projects

git clone https://github.com/narethim/tools.git
```

### For `x86_64` systems

node_exporter

```sh
cd $USER/projects/tools/ansible

ansible-playbook -i inventory playbooks/pb-node-exporter-x86_64.yml
```

prometheus

```sh
cd $USER/projects/tools/ansible

ansible-playbook -i inventory playbooks/pb-prometheus-x86_64.yml
```

grafana

```sh
cd $USER/projects/tools/ansible

ansible-playbook -i inventory pb-install-grafana-server-x86_64.yml
```

### For `arm64` systems (Jetson TX2, Jetson NANO)

node_exporter

```sh
cd $USER/projects/tools/ansible

ansible-playbook -i inventory playbooks/pb-node-exporter-arm64.yml
```

### For `armv7` systems (Raspberry Pi 3 B/B++)

node_exporter

```sh
cd $USER/projects/tools/ansible

ansible-playbook -i inventory playbooks/pb-node-exporter-armv7.yml
```

## Run playbooks to un-install Node Exporter

node_exporter

```sh
cd $USER/projects/tools/ansible

ansible-playbook -i inventory playbooks/pb-remove-node-exporter-x86_64.yml

ansible-playbook -i inventory playbooks/pb-remove-prometheus-x86_64.yml

ansible-playbook -i inventory playbooks/pb-remove-grafana-server-x86_64.yml
```

### For `arm64` systems (Jetson TX2, Jetson NANO) Node Exporter

node_exporter

```sh
cd $USER/projects/tools/ansible

ansible-playbook -i inventory playbooks/pb-remove-node-exporter-arm64.yml
```

### For `armv7` systems (Raspberry Pi 3 B/B++) Node Exporter

node_exporter

```sh
cd $USER/projects/tools/ansible

ansible-playbook -i inventory playbooks/pb-remove-node-exporter-armv7.yml
```
