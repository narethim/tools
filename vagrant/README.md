# Vagrant info

## Increase disk size in VM

By deafault `vagrant' create a 10 GB VM.

### Install `vagrant-disksize` plugin in host machine

```sh
vagrant plugin install vagrant-disksize
```

Add the following line to the `Vagrantfile` file

```ruby

vagrant.configure('2') do |config|
    config.disksize.size = '50GB'
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
