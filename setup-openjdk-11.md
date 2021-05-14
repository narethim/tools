# Setup OpenJDK 11

## CentOS 7 Installation

* How to Install OpenJDK 11 on CentOS 7 [link](https://sysadminxpert.com/install-openjdk-11-on-centos-7/)

### Step 1: Install OpenJDK 11 on CentOS 7

```sh
sudo yum -y install java-11-openjdk java-11-openjdk-devel

# Add JAVA_HOME to .bash_profile
echo "export JAVA_HOME=$(dirname $(dirname $(readlink $(readlink $(which javac)))))" >> ~/.bash_profile

source ~/.bash_profile
```

### Step 2: Verify Java Version

```sh
java -version
```

### Step 3: Set or configure default Java version on CentOS 7

```sh
sudo alternatives --config java
```

### Step 4: Set default Javac on CentOS 7

```sh
sudo alternatives --config javac
```

```sh
javac -version
```
