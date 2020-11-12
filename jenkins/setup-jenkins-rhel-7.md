# setup-jenkins-rhel-7.md

## Install

### Red Hat / CentOS

[https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos](https://www.jenkins.io/doc/book/installing/linux/#red-hat-centos)

```sh
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install jenkins java-1.8.0-openjdk-devel
sudo systemctl daemon-reload
```

## Start `jenkins`

```sh
sudo systemctl start jenkins

sudo systemctl status jenkins
```

## Post-installation setup wizard

Unlocking Jenkins

firefox http://localhost:8080

```sh
User: jenkins
Password: ****
Full name: Jenkins
Email: jenkins@gmailcom
```
