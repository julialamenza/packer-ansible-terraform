/*
Author: Julia Lamenza
*/

#Output of results at the end of execution
output "vpc_id" {
  value = "${aws_vpc.main.id}"
}
output "public_subnets" {
  value = "${join(",", aws_subnet.public-subnet.*.id)}"
}
output "private_subnets" {
  value = "${join(",", aws_subnet.private-subnet.*.id)}"
}
output "azs" {
  value = "${lookup(var.azs, var.region)}"
}
