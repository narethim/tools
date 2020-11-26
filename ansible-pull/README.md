# ansible-pull example

## Setup

```sh
sudo apt update
sudo apt install -y git
sudo apt install -y ansible
```

It's a good idea to create an ssh-key as well: 

```sh
ssh-keygen
```

```sh
git clone https://github.com/narethim/ansible_pull_example.git
```

Setup global git configuration:

```sh
git config --global user.email "narethi@yaoo.com"
git config --global user.name "Nareth Im"
```

## Usage

```sh
sudo ansible-pull -U https://github.com/narethim/ansible_pull_example.git
```

Verify user `ansible` is created:

```sh
ls -l /home

cat /etc/passwd
```

Verify cron job for user `ansible`:

```sh
sudo crontab -u ansible -l
```

## Reference

* [https://github.com/jlacroix82/ansible_pull_tutorial](https://github.com/jlacroix82/ansible_pull_tutorial) at GitHub
* [Using Ansible "Pull" Mode to Dynamically Automate Server/Workstation Builds](https://www.youtube.com/watch?v=sn1HQq_GFNE) at YouTube
* [Using Ansible Pull](https://wiki.learnlinux.tv/index.php/Using_Ansible_Pull) -LearnLinux.tv wiki page
