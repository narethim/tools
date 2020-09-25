# Creating and Configuring Slaves/Nodes using SSH

## Nodes

### Master node

* Need openssh-server installed
* Jenkins installed

### Windows Slave node

* OpenJDK 8 or newer
* c:/jenkins_2 directory

## Cofigure nodes

### Cofigure Linux Master node

Manage Jenkins > System Configuration > Configure System

```sh
Jenkins Location:

# Change from:
Jenkins URL: htt://localhost:8080/

# Change to: replace localhost with the IP address of the Jenkin Master Agent
Jenkins URL: htt://192.168.0.193:8080/

Save
```

Manage Jenkins > Manage Nodes and Clouds > New Node

```sh
Node name: windows_10_agent_2
(*) Permanent Agent

OK
```

```sh
Remote root directory: C:/jenkins_2
Labels               : windows
Usage                : Use this node as much as possible
Launch method        : Launch agent by connecting it to the master

Availability         : Keep this agent online as much as possible
```

Select windows_10_agent_2

```sh
* Run from agent command line:

java -jar agent.jar -jnlpUrl http://192.168.0.193:8080/computer/windows_10_agent_2/slave-agent.jnlp -secret e560913977fb0465fbabaf003249257a480491ffec0f25ea8b6f6ccc7fa318be -workDir "c:/jenkins_2"
```

### Cofigure Windows Slave node

```cmd
mkdir C:\jenkins_2
```

Copy agent.jar to C:\jenkins_2

```cmd
cd C:\jenkins_2

java -jar agent.jar -jnlpUrl http://192.168.0.193:8080/computer/windows_10_agent_2/slave-agent.jnlp -secret e560913977fb0465fbabaf003249257a480491ffec0f25ea8b6f6ccc7fa318be -workDir "c:/jenkins_2"
```

```sh

...

INFO: Remote identity confirmed: ba:6f:60:5d:61:c7:86:ff:6b:9e:5d:e9:c9:d9:ba:2b
Sep 24, 2020 4:52:40 PM hudson.remoting.jnlp.Main$CuiListener status
INFO: Connected
```
