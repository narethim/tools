# Install Jenkins

## Prerequisite

* Install OpenJDK

## Download Jenkins

For Ubuntu

Download from [https://www.jenkins.io/download](https://www.jenkins.io/download)

Select `Ubuntu/Debuan` link under "`Download Jenkins 2.235.5 LTS For:`

## Install Jenkins as a service

```sh
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
```

Use vi editor to open file `/etc/apt/sources.list`

add the following line at the end of file:

```sh
deb https://pkg.jenkins.io/debian-stable binary/
```

Update your local package index, then finally install Jenkins: 

```sh
sudo apt-get update
sudo apt-get install jenkins
```

## Start Jenkins

### Start Jenkins service

```sh
# Start jenkins
sudo systemctl start jenkins
```

```sh
# Check jenkins status
sudo systemctl status jenkins
```

```sh
# Stop jenkins
sudo systemctl stop jenkins
```

### Start Jenkins client in Firefox browser

```sh
# Stop jenkins
firefox http://localhost:8080
```

Unlock Jenkins

```sh
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

Copy and paste into password field

Select `Install suggested plugins`

#### Configure user

```sh
User: imnare
Password: ***
Full name: Jenkins
Email: example@ga.com
```

```sh
Jenkins URL: http://localhost:8080
```
