
/*Import a SSH Key to do  SSH Access in the Instance*/
resource "aws_key_pair" "keyPair" {
  key_name   = "${var.tag_name}"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDkY+Ex39NbPaGNvURML+fdA6afwI06/pyJzpACh6D16IdsN/TqHw20pJUyEFpum0Av+ADoHTCl/s4qbZrf9alIztSddQfyiOtdzgKYX3RPcWraJw5/ef/PxzKkCU4mBbOrWiW9079UFS/yY7nkiwNWYp5kRMUezY9jNfhdEh1FcJ6eWfsm03evzyf1mkMB5IpRZpAg9yKlKf1p5ZhPWG4EN+TaIk/UcGAuUufFih7A7J2/CSuoYpCJ3cBARYV7rJN+8mqcVgIUOrJ+AX4p1Yd8lcIFIWsLwwbrWXv+8M/GJF+vinL1I1FsI1xFMQcv2XD54Y/shi1kQ/Y2/PpIuqlD ubuntu@ip-10-0-3-7"
}
