# hello example1

* Follow example [How to create a Linux RPM package](https://www.redhat.com/sysadmin/create-rpm-package)

## Prerequisite

```sh
sudo yum install -y rpm-build
sudo yum install -y rpmdevtools rpmlint
sudo yum install -y tree
```

## Create `rpmbuild`

```sh
mkdir ~/projects
cd ~/projects

git clone https://github.com/narethim/tools.git

ln -s ~/projects/tools/rpm-tools/example1 ~/rpmbuild

cd ~
```

## Steps

### Step 1 - Initial directory structure and contents

```sh
tree rpmbuild
rpmbuild
├── BUILD
│   └── hello-0.0.1
│       └── hello.sh
├── BUILDROOT
├── README.md
├── RPMS
├── SOURCES
│   └── hello-0.0.1.tar.gz
├── SPECS
│   └── hello.spec
└── SRPMS
```

### Step 2 - Create rpm

```sh
rpmbuild -bb ~/rpmbuild/SPECS/hello.spec
```

```sh
tree rpmbuild
rpmbuild
├── BUILD
│   └── hello-0.0.1
│       └── hello.sh
├── BUILDROOT
├── README.md
├── RPMS
│   └── noarch
│       └── hello-0.0.1-1.el7.noarch.rpm   `<=====`
├── SOURCES
│   └── hello-0.0.1.tar.gz
├── SPECS
│   └── hello.spec
└── SRPMS
```

### Step 3 - Install rpm

```sh
sudo yum install ~/rpmbuild/RPMS/noarch/hello-0.0.1-1.el7.noarch.rpm
```

To verify the package has correctly been installed, run the following command:

```sh
rpm -qi hello
```

The %changelog entry of a package can be viewed, too:

```sh
rpm -q hello --changelog
```

It's easy to see which files an RPM package contains:

```sh
rpm -ql hello
```

### Step 4 - Remove `hello` rpm package

```sh
sudo yum remove hello
```
