# Molecule example

## Prerequisite

```sh
pip3 install molecule-docker
```

* [Getting Started Guide](https://molecule.readthedocs.io/en/latest/getting-started.html)

## Initialize

```sh
molecule init role my-role --driver-name=docker
```

Run it

```sh
cd my-role
molecule test
```

## Converge

```sh
cd my-role

molecule converge
```

```sh
molecule login
```

```sh
molecule destroy
```

## Modify task

my-role/tasks/main.yml

```yml
- name: Molecule Hello World!
  debug:
    msg: Hello, World!
```

```sh
molecule create

molecule list

docker ps
```

```sh
molecule converge
```

```sh
molecule login
```

```sh
molecule destroy
```

## Run a full test sequence

```sh
molecule test
```
