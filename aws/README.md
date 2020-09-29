# AWS

[AWS account](https://us-west-2.console.aws.amazon.com/console/home?nc2=h_ct&src=header-signin&region=us-west-2)

[AWS portal](https://us-west-2.console.aws.amazon.com/console/home?nc2=h_ct&src=header-signin&region=us-west-2)

## EC2

* [ec2](https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Home:)
* [ec2 instance](https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Instances:)

## Cost

* [Billing](https://console.aws.amazon.com/billing/home?region=us-west-2#/)

## Setup Environment

```sh
export AWS_ACCESS_KEY_ID='AK123'
export AWS_SECRET_ACCESS_KEY='abc123'
```

## Connect to AWS VM

Connect a terminal to AWS VM

```sh
ssh -i ~/Documents/aws/my-key-pair-oregon.pem ubuntu@<public ip address>
```
