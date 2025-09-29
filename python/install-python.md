# Python Info

## Install latest Python version on Ubuntu 22.04

* Default version is python3.10

### Install python3.13

```sh
sudo apt install software-properties-common -y

sudo add-apt-repository ppa:deadsnakes/ppa

sudo apt install python3.13
```

### Install support packages

```sh
sudo apt install python3.13-dev python3.13-venv python3.13-distutils python3.13-gdbm python3.13-tk python3.13-lib2to3 -y
```

### Application that depends on python3.10

```sh
sudo apt-cache rdepends python3.10 | wc -l

python3 -V

ls -l /usr/bin/python*
```

### Set default python version

```sh
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.13 2

sudo update-alternatives --config python
```

### Verify

```sh
python -V
Python 3.13.7

python3 -V
Python 3.10.12
```

## References

* [Install Python 3.11 in Ubuntu 22.04 Desktop](https://www.youtube.com/watch?v=9QftEX6yZP4) YouTube
* [Python for Data Analytics - Full Course for Beginners](https://www.youtube.com/watch?v=wUSDVGivd-8&t=1144s)
* [My Python Development Environment Setup - Full Tutorial](https://www.youtube.com/watch?v=qI3P7zMMsgY)
* [Getting started with Anaconda and Python on Windows](https://www.youtube.com/watch?v=4DQGBQMvwZo)
