output "vpcid" {
  value = aws_vpc.module_vpc.id
  }

output "publicsubnetall" {
  value = "${aws_subnet.public_subnets.*.id}"
  }

  output "privatesubnetall" {
    value = "${aws_subnet.private_subnets.*.id}"
  }

output "securitygroup" {
   value = aws_security_group.allowall.id
}

output "env" {
   value = "${var.environment}"
   }