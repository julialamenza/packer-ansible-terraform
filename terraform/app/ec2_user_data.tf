
/*Template user data used to pass variables to user data template .*/
data "template_file" "user_data" {
  template = "${file("ec2_user_data_template.sh")}"
  vars = { }
}
