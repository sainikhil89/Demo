resource "aws_subnet" "public_subnets"{
  count =  "${length(var.public_subnets)}"
  vpc_id = aws_vpc.module_vpc.id
  availability_zone = "${element(var.azs,count.index)}"
  cidr_block = "${element(var.public_subnets,count.index)}"
  tags = {
    Name = "${var.env}-publicsubnet-${count.index+1}"
  }
}



resource "aws_subnet" "private_subnets"{
  count = "${length(var.private_subnets)}"
  vpc_id = aws_vpc.module_vpc.id
  availability_zone = "${element(var.azs,count.index)}"
  cidr_block = "${element(var.private_subnets,count.index)}"
  tags = {
    Name = "${var.env}-privatesubnet-${count.index+1}"
  }
}