
# Install docker

## For Ubuntu

* [Installation documentation](https://docs.docker.com/engine/install/ubuntu/)

```sh
sudo apt  install docker.io

sudo usermod -aG docker $USER
```

Logout and login

```sh
docker container run hello-world
```

## For CentOS

### Setup the repository

* [Installation documentation](https://docs.docker.com/engine/install/centos/)

```sh
sudo yum install -y yum-utils

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

```sh
# Check user  group
id -Gn $USER
```

### Install docker engine

```sh
sudo yum install docker-ce docker-ce-cli containerd.io
```

```sh
# Start docker
sudo systemctl start docker

# Check docker status
sudo systemctl status docker
```

```sh
sudo usermod -aG docker $USER

id -Gn $USER
```

Logout and login

```sh
docker container run hello-world
```

# docker hello

## dockerhub login

* [https://hub.docker.com/](https://hub.docker.com/)

docker hub login

user: narethim
pwd: ***

## Tag and push to dockerhub

```sh
docker image tag myhello narethim/myhello

docker image push narethim/myhello
```

## Run the image

```sh
docker container run -p 9990:8888 narethim/myhello
```

Open a web browser

```sh
firefox http://localhost:9990
```

Run from browser: http://localhost:9990

# Some docker commands

```sh
docker --version

docker ps

docker images
```
