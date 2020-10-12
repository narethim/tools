# Ansible example-role-hello

## Prerequisite

* Ansible is installed

## Ansible roles Details

```sh
ansible-galaxy list

ansible-galaxy install irixjp.role_example_hello

ansible-galaxy list
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

Create a `test-1.yml` file in `~/projects`

```yml
---
- hosts: nodes
  roles:
    - { role: irixjp.role_example_hello }
```

```sh
cd ~/projects

ansible-playbook test-1.yml
```

Create a `test-2.yml` file in `~/projects`

```yml
---
- hosts: nodes
  roles:
    - irixjp.role_example_hello
```

```sh
cd ~/projects

ansible-playbook test-2.yml
```

Create a `test-3.yml` file in `~/projects`
It illustrate the use of `import_role` construct.

```yml
---
- hosts: nodes
  tasks:
    - name: Print a message
       ansible.builtin.debug:
         msg: "before we run our role"

    - name: Import the role
      import_role:
        name: irixjp.role_example_hello

    - name: Print a message
       ansible.builtin.debug:
         msg: "after we run our role"

    - name: get locale a message
      sample_get_locale:
      register: ret

    - debug: var=ret
```

```sh
cd ~/projects

ansible-playbook test-3.yml
```

## References

* [role_example_hello](https://galaxy.ansible.com/irixjp/role_example_hello) in galaxy.ansible.com

* [ansible-roles-explained-with-examples](https://www.learnitguide.net/2018/02/ansible-roles-explained-with-examples.html)

* [https://www.learnitguide.net/](https://www.learnitguide.net/)
