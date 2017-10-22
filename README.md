# packer-ansible-terraform-cloud formation

** This repository is about how I use packer, ansible, terraform and cloud formation to create a stack in aws. **

#### Start installing this:

- Install AWS CLI (root permission)
- Packer  1.1.1
- Terraform 10.07


##### First, it is necessary to prepare the AWS account with some resources to run the automation through Terraform, for this you need to create a **Stack** using Cloudformation and import the template using this file **cf_terraform_setup.yml.**

- Go to AWS console
- Click on cludformation service
- Create a Stack and then Design a template

**During the process ll be necessary to inform a bucket name** inform the name that you wish.
On the **output** window ll be displayed the access credentials that must be used to make the API calls in the aws account.

###### In the terminal export the variables, replace it using the credentials output:

```
export AWS_ACCESS_KEY_ID='<YOUR ApiUserAccessKey>'
export AWS_SECRET_ACCESS_KEY='<YOUR ApiUserSecretKey>'
```
##### After that we 'll start the orquestration using **terraform** to create:

- 1 VPC;
- 1 Internet Gateway;
- Nat Gateway;
- 1 EIP;
- (2) Public Subnets (public DNS activated);
- (2) Private Subnets ;
- 1 Route Table to public subnet (default route to IGW);
- 1 Route Table to private subnet (default route to Nat Gateway);


Access the terraform **/ vpc directory** and edit the files: **remote_state.tf**

Change the value **<BUCKET_NAME>** to the bucket name that you created on the CloudFormation, if necessary change the 'region'.

###### **terraform/vpc/remote_state.tf** 
```sh
  backend "s3" {
    bucket  = "bucket-name" #-> change it to the name that you choose
    encrypt = "true"
    key     = "vpc/vpc.tfstate"
    region  = "us-east-1" #-> change the region if you are using an other region
  }
}
```
##### Access the terraform / vpc directory and initialize the remote backend:
```$ terraform init ```

##### Generate the execution plan to verify all the resources that are created:
```$ terraform plan```

##### Apply the execution plan:
```$ terraform apply ```

 Return to the root project  directory, edit the file **ami-sample.json**, and change the <PUBLIC_SUBNET> value to the value of only one public subnet that was given by the output from the previous step.

##### To build your ami using packer you should use the command bellow:

```$ packer build ami-sample.json ```

After the creation of the AMI, we will 'set up' the last part of our architecture.

 Access the terraform **/ app directory**, and as done in Step 1, change the value of **<BUCKET_NAME>** to the bucket name that you created in the **remote_state.tf** file, If necessary, change the region key.

###### terraform/app/remote_state.tf:

```sh
terraform {
  backend "s3" {
    bucket  = "bucket-name"
    encrypt = "true"
    key     = "app/app.tfstate"
    region  = "us-east-1"
  }
}
```
##### Do the same in the var.tf file.

##### Repeat the commands from step 2 but now in the terraform / app directory:
```sh
$ terraform init
$ terraform plan
$ terraform apply
```


##### Ansible directory has the content that you customize our AMI 
- Install Nginx
- Create user
- Create swap partition

