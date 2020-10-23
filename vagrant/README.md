# Vagrant info

![vagrant-logo](docs/images/vagrant-logo.png)

## Increase disk size in VM

Note: Not reliable. Should not use it.
Should create a Vagrant box image with large disk space (100GB) using packer.

By default `vagrant' create a 10 GB VM.

### Install `vagrant-disksize` plugin in host machine

```sh
vagrant plugin install vagrant-disksize
```

Add the following line to the `Vagrantfile` file

```ruby
vagrant.configure('2') do |config|
    config.disksize.size = '64GB'
end
```

Check disk space useing `df -h` command

```sh
vagrant up

vagrant ssh

df -h
```

### Source of info

* [How can I increase disk size on a Vagrant VM?](https://askubuntu.com/questions/317338/how-can-i-increase-disk-size-on-a-vagrant-vm)

## Vagrant examples

* [vagrant-examples/ex-1](https://github.com/narethim/vagrant-examples/tree/master/ex-1) - vagrant, ansible roles example
* [vagrant-examples/ex-2](https://github.com/narethim/vagrant-examples/tree/master/ex-2) - vagrant, simple ansible playbook example
* [vagrant-examples/ex-3](https://github.com/narethim/vagrant-examples/tree/master/ex-3) - vagrant, ansible playbook, templates example

* [vagrant-examples/ex-4](https://github.com/narethim/vagrant-examples/tree/master/ex-4) - for Ubuntu 16.04
* [vagrant-examples/ex-41](https://github.com/narethim/vagrant-examples/tree/master/ex-41) - for Ubuntu 18.04 with Ansible provision
* [vagrant-examples/ex-5](https://github.com/narethim/vagrant-examples/tree/master/ex-5) - for CentOS/7 and CentOS/8 with Ansible provision
* [vagrant-examples/ex-6](https://github.com/narethim/vagrant-examples/tree/master/ex-6) - for For Ubuntu with multiple VM instances
