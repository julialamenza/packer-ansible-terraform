# packer-ansible-terraform

The  < ami-sample.json > file is  the packer template that ll build the ami.

The < my-stack.yml > is the cloud formation stack template that you should create on your aws console:
-> Cloud Formation -> Create Stack

The  ANSIBLE directory contains our ansible files as playbook and roles

The TERRAFORM directory contains our terraform files that ll build our vpc, s3 bucket, autoscaling, subnets, etc
