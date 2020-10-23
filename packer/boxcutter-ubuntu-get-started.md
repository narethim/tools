# Boxcutter

## git clone it

```sh
mkdir -p ~/projects/github/packer

cd ~/projects/github/packer

git clone https://github.com/boxcutter/ubuntu.git

cd ubuntu
```

## Create Vagrant boxes

### Create a Vagrant box ubuntu1804

Modify file `ubuntu1804.json`

```json
{
  "iso_checksum": "sha256:8c5fc24894394035402f66f3824beb7234b757dd2b5531379cb310cedfdf0996",  
  "iso_name": "ubuntu-18.04.5-server-amd64.iso",
  "iso_url": "http://cdimage.ubuntu.com/ubuntu/releases/18.04/release/ubuntu-18.04.5-server-amd64.iso",
}
```

Build it

```sh
cd ~/projects/github/packer/ubuntu
bin/box build ubuntu1604 virtualbox
```

Output image should be in:

```sh
box/virtualbox/ubuntu1604-17.0907.1.box
```

### Create a Vagrant box ubuntu1604

Modify file `ubuntu1604.json`

```json
{
  "disk_size": "102400",
  "iso_checksum": "b23488689e16cad7a269eb2d3a3bf725d3457ee6b0868e00c8762d3816e25848",  
  "iso_name": "ubuntu-16.04.7-server-amd64.iso",
  "iso_url": "http://releases.ubuntu.com/16.04/ubuntu-16.04.7-server-amd64.iso",
}
```

Build it

```sh
cd ~/projects/github/packer/ubuntu
bin/box build ubuntu1804 virtualbox
```

Output image should be in:

```sh
box/virtualbox/ubuntu1604-17.0907.1.box
```

## Add Vagrant boxes

```sh
vagrant box add --name narethim/ubuntu-1804 ~/projects/github/packer/ubuntu/box/virtualbox/ubuntu1804-17.0907.1.box
vagrant box list
```

```sh
vagrant box add --name narethim/ubuntu-2004 ~/projects/github/packer/ubuntu/box/virtualbox/ubuntu2004-17.0907.1.box
vagrant box list
```

e.g.

```sh
ubuntu@ubuntu-OptiPlex-790:~/projects/github$ vagrant box add --name narethim/ubuntu-1804 ~/projects/github/packer/ubuntu/box/virtualbox/ubuntu1804-17.0907.1.box
==> box: Box file was not detected as metadata. Adding it directly...
==> box: Adding box 'narethim/ubuntu-1804' (v0) for provider: 
    box: Unpacking necessary files from: file:///home/ubuntu/projects/github/packer/ubuntu/box/virtualbox/ubuntu1804-17.0907.1.box
==> box: Successfully added box 'narethim/ubuntu-1804' (v0) for 'virtualbox'!
ubuntu@ubuntu-OptiPlex-790:~/projects/github$ vagrant box list
narethim/ubuntu-1804 (virtualbox, 0)
```

## Verify

Verfy image: narethim/ubuntu-1804

```sh
mkdir -p ~/projects/vagrant-verify/ubuntu-1804
cd ~/projects/vagrant-verify/ubuntu-1804

vagrant init narethim/ubuntu-1804

vagrant up
```

Verfy image: narethim/ubuntu-2004

```sh
mkdir -p ~/projects/vagrant-verify/ubuntu-2004
cd ~/projects/vagrant-verify/ubuntu-2004

vagrant init narethim/ubuntu-2004

vagrant up
```
