
/*Creates a launch configuration*/
resource "aws_launch_configuration" "launchConfiguration" {
  iam_instance_profile = "${aws_iam_instance_profile.instProfile.name}"
  image_id             = "${data.aws_ami.packer-ami.id}"
  instance_type        = "${var.instance_type}"
  key_name             = "${aws_key_pair.keyPair.key_name}"
  name_prefix          = "lc-${var.tag_name}"
  security_groups      = ["${module.instances_sg.sg_id}"]
  user_data            = "${data.template_file.user_data.rendered}"
  lifecycle {
    create_before_destroy = true
  }
}
