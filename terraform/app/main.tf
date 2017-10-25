/*Uses the AWS provider in the region specified in the vars.tf file*/
provider "aws" {
  region = "${var.region}"
}

/*Datasource used to capture information from the provisioned VPC, so it is possible to access variables from another project to be used.*/
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "${var.region}"
    bucket = "${var.bucket_name}"
    key = "vpc/vpc.tfstate"
  }
}
