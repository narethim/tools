# Setup Jenkins Using Docker

## Installation

Starting a basic jenkins container

```sh
docker run -p 8080:8080 -p 50000:50000 jenkins/jenkins
```

For attaching volume

```sh
sudo mkdir /var/jenkins

# Give permission to Jenkins account to the folder
sudo chown 1000 /var/jenkins
```

Run `Jenkins` as detached container in background

```sh
docker run -d -p 8080:8080 -p 50000:50000 -v /var/jenkins:/var/jenkins_home --name myjenkins1 jenkins/jenkins:latest
```

## Run `Jenkins`

[http://localhost:8080](http://localhost:8080)

Get initial admin password

```sh
cat /var/jenkins/secrets/initialAdminPassword
```

## Run multiple instances of jenkins

Run another instance of Jenkins `myjenkins2`

```sh
sudo mkdir /var/jenkins2

# Give permission to Jenkins account to the folder
sudo chown 1000 /var/jenkins2

docker run -d -p 8081:8080 -p 50001:50000 -v /var/jenkins2:/var/jenkins_home --name myjenkins2 jenkins/jenkins:latest
```

Get initial admin password

```sh
cat /var/jenkins2/secrets/initialAdminPassword
```

```sh
firefox http://localhost:8081
```

Create first user admin:

```sh
Username: admin
Password: admin
Fullname: Jenkins
E-mail address: jenkins@gmail.com
```
