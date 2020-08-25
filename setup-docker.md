
# Install docker

For Ubuntu

```sh
sudo apt  install docker.io

sudo usermod -aG docker $USER
```

Logout and login

```sh
docker container run hello-world
```

# docker hello

## dockerhub login

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
docker ps

```
