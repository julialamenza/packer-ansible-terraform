
/*Search for an AMI with the name started by the defined name, always use the last one*/
data "aws_ami" "packer-ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["packer-*"]
  }
}

