/*Creates an EIP that will be used by NAT gatewayy*/
resource "aws_eip" "eip_nat" {
  vpc = true
  lifecycle {
    create_before_destroy = true
  }
}
/*Creates  a NatGateway*/
resource "aws_nat_gateway" "natgw" {
  allocation_id = "${aws_eip.eip_nat.id}"
  subnet_id     = "${element(aws_subnet.public-subnet.*.id, count.index)}"
  lifecycle {
    create_before_destroy = true
  }
}
