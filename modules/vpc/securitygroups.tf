resource "aws_security_group" "allowall"{
   description = "allow all inbound traffic"
   vpc_id = aws_vpc.module_vpc.id

   ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "{var.env}-sg"
  }
}
