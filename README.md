# packer-ansible-terraform

The file < ami-sample.json > is a the packer template that ll build the ami as we wish

The < my-stack.yml > is the cloud formation stack template that you should create on your aws console -> Cloud Formation -> Create Stack

The directory ANSIBLE contain our ansible files as playbook and roles

The directory TERRAFORM contain our terraform files that ll build our vpc, s3 bucket, autoscaling, subnet, etc
