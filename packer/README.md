# Packer info

![packer-logo](docs/images/packer-logo.png)

* Build Automated Machine Images
* Build Vagrant Box Images

## Installation

Ubuntu

```sh
#Add the HashiCorp GPG key.
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

# Add the official HashiCorp Linux repository.
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Update and install.
sudo apt-get update && sudo apt-get install packer
```

## Getting started

* [Jeff Geerling's Vagrant Box Packer Builds](https://github.com/narethim/packer-boxes) - A forked project. It works so far.
* [boxcutter/ubuntu get-started](boxbutter-ubuntu-getstarted.md) - Not quite working correctly. It's kind of flaky with some of the build.

## References

* [https://www.packer.io/](https://www.packer.io/)

## Packer examples

* [boxcutter/ubuntu](https://github.com/boxcutter/ubuntu) - Packer templates for Ubuntu - packer usage examples
