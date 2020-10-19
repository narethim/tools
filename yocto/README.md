# Yocto info

## Yocto

* [Yocto Project Quick Build](https://www.yoctoproject.org/docs/3.1.3/brief-yoctoprojectqs/brief-yoctoprojectqs.html)

* [https://www.yoctoproject.org/docs/](https://www.yoctoproject.org/docs/)

* [yoctoproject reference manual](https://www.yoctoproject.org/docs/3.1.3/ref-manual/ref-manual.html#detailed-supported-distros)

## Yocto/Vagrant examples

* [vagrant-examples/ex-41](https://github.com/narethim/vagrant-examples/ex-4) For Ubuntu

* [vagrant-examples/ex-5](https://github.com/narethim/vagrant-examples/ex-5) For CentOS/7 and CentOS/8

## Building Your Image¶

```sh
vagrant sh
```

```sh
cd ~/poky

git fetch --tags
git tag
```

For this example, check out the branch based on the yocto-3.1.3 release:

```sh
cd ~/poky

git checkout tags/yocto-3.1.3 -b my-yocto-3.1.3
     Switched to a new branch 'my-yocto-3.1.3'

```

### 1. Initialize the Build Environment

```sh
cd ~/poky

source oe-init-build-env
```

### 2. Examine Your Local Configuration File

When you set up the build environment, a local configuration file named local.conf becomes available in a conf subdirectory of the Build Directory. For this example, the defaults are set to build for a qemux86 target, which is suitable for emulation. The package manager used is set to the RPM package manager.

### 3. Start the Build

```sh
bitbake core-image-sato
```

### 4. Simulate Your Image Using QEMU

```sh
runqemu qemux86-64
```

### 5. Exit QEMU

Exit QEMU by either clicking on the shutdown icon or by typing Ctrl-C in the QEMU transcript window from which you evoked QEMU.
