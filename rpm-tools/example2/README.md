# cello example2

* Follow example [RPM Packaging Guide](https://rpm-packaging-guide.github.io/)

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

ln -s ~/projects/tools/rpm-tools/example2 ~/rpmbuild

cd ~/rpmbuild

rpmdev-setuptree

cd ~
```

## Steps

### Step 1 - Initial directory structure and contents

```sh
tree
.
├── BUILD
├── BUILDROOT
├── README.md
├── RPMS
├── SOURCES
│   └── cello-1.0.tar.gz
├── SPECS
│   └── cello.spec
└── SRPMS
```

### Step 2 - Create rpm

### Source RPMs

To create a SRPM:

```sh
rpmbuild -bs ~/rpmbuild/SPECS/cello.spec
Wrote: /home/centos/rpmbuild/SRPMS/cello-1.0-1.el7.src.rpm

[centos@localhost rpmbuild]$ tree
[centos@localhost rpmbuild]$ tree
.
├── BUILD
├── BUILDROOT
├── README.md
├── RPMS
├── SOURCES
│   └── cello-1.0.tar.gz
├── SPECS
│   └── cello.spec
└── SRPMS
    └── cello-1.0-1.el7.src.rpm

6 directories, 4 files

```

### Binary RPMS

* Building Binary from the SPEC file

```sh
rpmbuild -bb ~/rpmbuild/SPECS/cello.spec

[centos@localhost rpmbuild]$ tree
.
├── BUILD
│   └── cello-1.0
│       ├── cello
│       ├── cello.c
│       ├── debugfiles.list
│       ├── debuglinks.list
│       ├── debugsources.list
│       ├── elfbins.list
│       ├── LICENSE
│       └── Makefile
├── BUILDROOT
├── README.md
├── RPMS
│   └── x86_64
│       ├── cello-1.0-1.el7.x86_64.rpm
│       └── cello-debuginfo-1.0-1.el7.x86_64.rpm
├── SOURCES
│   └── cello-1.0.tar.gz
├── SPECS
│   └── cello.spec
└── SRPMS
    └── cello-1.0-1.el7.src.rpm

8 directories, 14 files

```

* Rebuilding from a Source RPM

```sh
rpmbuild --rebuild ~/rpmbuild/SRPMS/cello-1.0-1.el7.src.rpm

[centos@localhost rpmbuild]$ tree
.
├── BUILD
├── BUILDROOT
├── README.md
├── RPMS
│   └── x86_64
│       ├── cello-1.0-1.el7.x86_64.rpm
│       └── cello-debuginfo-1.0-1.el7.x86_64.rpm
├── SOURCES
├── SPECS
└── SRPMS
    └── cello-1.0-1.el7.src.rpm

7 directories, 4 files

```

### Step 3 - Install rpm

```sh
sudo yum install ~/rpmbuild/RPMS/x86_64/cello-1.0-1.el7.x86_64.rpm

# Run cello
cello
Hello World
```

To verify the package has correctly been installed, run the following command:

```sh
rpm -qi cello
```

The %changelog entry of a package can be viewed, too:

```sh
rpm -q cello --changelog
```

It's easy to see which files an RPM package contains:

```sh
rpm -ql cello
```

### Step 4 - Remove `cello` rpm package

```sh
sudo yum remove cello
```
