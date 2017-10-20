
/*Provisiona ALB na rede pública*/
resource "aws_lb" "loadBalancer" {
  name = "lb-${var.tag_name}"
  internal = false
  security_groups = ["${module.loadbalancer_sg.sg_id}"]
  subnets = ["${split(",", data.terraform_remote_state.vpc.public_subnets)}"]
  enable_deletion_protection = false
  lifecycle {
    create_before_destroy = true
  }
}
/*Criar um listener na porta definida para o ALB criado acima*/
resource "aws_lb_listener" "eblistener" {
  listener_arn = "${aws_lb.loadBalancer.arn}"
  port = "${var.lb_listen_port}"
  protocol = "HTTP"
  default_action {
    target_group_arn = "${aws_lb_target_group.targetGroup.arn}"
    type = "forward"
  }
  lifecycle {
    create_before_destroy = true
