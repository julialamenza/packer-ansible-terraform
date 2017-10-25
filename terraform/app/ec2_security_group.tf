
/*Creates a SG tp be used in the intances that austoscaling group creates*/
module "instances_sg" {
  source   = "../modules/aws_security_group"
  vpc_id   = "${data.terraform_remote_state.vpc.vpc_id}"
  tag_name = "SG-${var.tag_name}"
}
/*Creates an SG to be use at ALB*/
module "loadbalancer_sg" {
  source   = "../modules/aws_security_group"
  vpc_id   = "${data.terraform_remote_state.vpc.vpc_id}"
  tag_name = "SG-ALB-${var.tag_name}"
}
/* Creates a rule if permission to any source acess  ALB on the port that was configured.*/
resource "aws_security_group_rule" "allow_connections_to_alb" {
  type              = "ingress"
  from_port         = "${var.alb_listen_port}"
  to_port           = "${var.alb_listen_port}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${module.loadbalancer_sg.sg_id}"
  lifecycle {
    create_before_destroy = true
  }
}
/*Creates a rule in the instance security group that allows access only to the ALB on the configured porta*/
resource "aws_security_group_rule" "allow_connections_from_alb" {
  type                     = "ingress"
  from_port                = "${var.app_listen_port}"
  to_port                  = "${var.app_listen_port}"
  protocol                 = "tcp"
  source_security_group_id = "${module.loadbalancer_sg.sg_id}"
  security_group_id        = "${module.instances_sg.sg_id}"
  lifecycle {
    create_before_destroy = true
  }
}
