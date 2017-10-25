/*
Author: Julia Lamenza 
*/

#Region to be used for VPC provisioning
variable "region" { default = "us-east-1" }

/*Availability Zones to be used for VPC provisioning, 2 subnet per availability zone will be created..*/
variable "azs" {
  default = {
    "us-east-1" = "us-east-1a,us-east-1b"
    }
  }
/*Range that will be used by the VPC, each subnet to be created, by default will be mask / 24*/
variable "vpc_cidr" { default = "10.0.0.0/16" }
