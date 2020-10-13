# Ansible example-docker

## Prerequisite

* Ansible is installed

## Ansible roles Details

```sh
cd ~/project/test-docker

ansible-galaxy install marvinpinto.docker -p ./roles
```

Setup default inventory at `/etc/ansible/hosts`

```conf
[k8s-master]
192.168.0.112

[k8s-node1]
192.168.0.225

[nodes:children]
k8s-master
k8s-node1

[nodes:vars]
ansible_python_interpreter=/usr/bin/python3
```

### Verify

Create a `test-1.yml` file in `~/projects/test-docker`

```yml
---
- hosts: 'servers'
  roles:
    - role: 'marvinpinto.docker'
      become: true
  tasks:
    - name: 'Ensure that the docker daemon is functional'
      become: true
      docker_ping:
      retries: 5
      delay: 10
      until: result|success
    - name: 'hello world'
      docker:
        name: 'helloworld'
        image: 'hello-world'
        state: 'started'
```

```sh
cd ~/projects/test-docker

ansible-playbook test-1.yml
```

## References

* [galaxy docker](https://galaxy.ansible.com/marvinpinto/docker)
