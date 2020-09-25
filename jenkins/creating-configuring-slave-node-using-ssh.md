# Creating and Configuring Slaves/Nodes using SSH

## Links

[Jenkins Tutorial For Beginners 16 - Creating and Configuring Slaves/Nodes using SSH](https://www.youtube.com/watch?v=NlwR_FEsE0A)

## Nodes

### Master node

* Need openssh-server installed
* Jenkins installed

### Slave node

* Need openssh-server installed
* OpenJDK 8 or newer
* ~/jenkins directory

## Cofigure node

Manage Jenkins > Manage Nodes and Clouds > New Node

```sh
Nade name: ubuntu_184_agent

(*) Permanent Agent

OK
```

```sh
Remote root directory: /home/ubuntu/jenkins
Labels               : ubuntu
Usage                : Use this node as much as possible
Launch method        : Launch agents via SSH
                       Host                         : 192.168.0.206
                       Credentials                  : ubuntu/**** (ubuntu agent)
                       Host Key Verificaion Strategy: Manually trusted key Verification Strategy

Availability         : Keep this agent online as much as possible
```
