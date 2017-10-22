
output "Enjoy it!!  ==> " {
  value = "${aws_alb.loadBalancer.dns_name}/en"
}

/*output "ami_id" {*/
  /*value = "${data.aws_ami.packer-ami.id}"*/
/*}*/
/*output "vpc_id" {*/
 /*value = "${data.terraform_remote_state.vpc.vpc_id}" */
/*}*/
/*output "private-subnets" {*/
 /*value = "${data.terraform_remote_state.vpc.private_subnets}" */
/*}*/
/*output "public-subnets" {*/
 /*value = "${data.terraform_remote_state.vpc.public_subnets}" */
/*}*/
/*output "azs" {*/
  /*value = "${data.terraform_remote_state.vpc.azs}"*/
/*}*/
