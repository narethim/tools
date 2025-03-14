# Terraform - KVM - Remote CentOS Image

* [Terraform - KVM - Remote CentOS Image](https://www.youtube.com/watch?v=mIoKBTo2bls&list=PL98Ky4zUU6hunuznC4JJGj1iao4PNoZX_&index=9)

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
