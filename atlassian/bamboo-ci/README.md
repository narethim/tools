# Atlassion Bamboo CI server

## Install

* [Getting started with Bamboo](https://confluence.atlassian.com/bamboo/getting-started-with-bamboo-289277283.html)

* [Installing Bamboo on Linux](https://confluence.atlassian.com/bamboo/installing-bamboo-on-linux-289276792.html)

Set `JAVA_HOME` environment in `~/.bashrc` file

```sh
export JAVA_HOME=/usr
export PATH=${PATH}:{JAVA_HOME}/bin
```

Create `bamboo` user

```sh
sudo /usr/sbin/useradd --create-home --home-dir /usr/local/bamboo --shell /bin/bash bamboo
```

## Start `bamboo` web application

```sh
cd atlassian/atlassian-bamboo-7.2.1/

./bin/start-bamboo.sh
```

## Web access

[http://localhost:8085/.](http://localhost:8085/.)

```sh
login: nim
pwd: ***
```

## References

* [Bamboo Introduction Part 1](https://www.youtube.com/watch?v=VTObPQJ1_SE)
* [Bamboo Introduction Part 2](https://www.youtube.com/watch?v=uffm6kdsNF4)
* [Bamboo Introduction Part 3](https://www.youtube.com/watch?v=W_k1L8SwZi4)
