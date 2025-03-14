# Terraform - KVM - Ubuntu Server Build

* [Terraform - KVM - Ubuntu Server Build](https://www.youtube.com/watch?v=psOft_cAdBk&list=PL98Ky4zUU6hunuznC4JJGj1iao4PNoZX_&index=8)

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
