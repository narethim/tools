# AWS

[AWS account](https://us-west-2.console.aws.amazon.com/console/home?nc2=h_ct&src=header-signin&region=us-west-2)

[AWS portal](https://us-west-2.console.aws.amazon.com/console/home?nc2=h_ct&src=header-signin&region=us-west-2)

## Documentation

* [https://docs.aws.amazon.com/index.html](https://docs.aws.amazon.com/index.html)

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

Example:

```sh
ssh -i ~/Documents/aws/my-key-pair-oregon.pem ubuntu@54.202.73.72

...

ubuntu@ip-172-31-8-197:~$
```

## Customize instance

```sh
# Install OpenJDK
sudo apt install default-jdk

# Install development tool g++, etc.
sudo apt install build-essential

# Install cmake
sudo apt install cmake

# Install ant
sudo apt install ant

```

## Set Up a Jenkins Build Server

* [Set Up a Jenkins Build Server](https://aws.amazon.com/getting-started/hands-on/setup-jenkins-build-server/)
* [aws-project_Jenkins-build-server.pdf](https://d1.awsstatic.com/Projects/P5505030/aws-project_Jenkins-build-server.pdf) - Follow the instruction in this pdf to get Jenkins to work on AWS
