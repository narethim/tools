# Terraform - KVM - Multi VM Build - Ubuntu Server

* [Terraform - KVM - Multi VM Build - Ubuntu Server](https://www.youtube.com/watch?v=Lt8cHwy-jEM&list=PL98Ky4zUU6hunuznC4JJGj1iao4PNoZX_&index=10)

## Test

```sh
terraform init

terraform plan

terraform apply
```

```sh
virsh list --all

 Id   Name          State
------------------------------
 2    test1         running
```


```sh
terraform destroy

or

terraform destroy -auto-approve
```

## Check network

```sh
virsh net-list

 Name      State    Autostart   Persistent
--------------------------------------------
 default   active   yes         yes
```

```sh
virsh list --all
```


```sh
virsh domiflist ubuntu22.04

 Interface   Type      Source    Model    MAC
-------------------------------------------------------------
 vnet3       network   default   virtio   52:54:00:f1:63:1b
```

```sh
netstat -iptl
```