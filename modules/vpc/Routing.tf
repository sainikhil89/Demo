resource "aws_route_table" "module_publicRT"{
  vpc_id = aws_vpc.module_vpc.id
   route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.module_igw.id
   }
     tags = {
        Name = "${var.env}-publicRT"
     }
}

resource "aws_route_table" "module_privateRT"{
  vpc_id = aws_vpc.module_vpc.id
     tags = {
        Name = "${var.env}-privateRT"
     }
}
#subnet association

resource "aws_route_table_association" "associate_public_subnets"{
  count = "${length(var.public_subnets)}"
  subnet_id = "${element(aws_subnet.public_subnets.*.id,count.index)}"
  route_table_id = aws_route_table.module_publicRT.id
}


resource "aws_route_table_association" "associate_private_subnets"{
  count = "${length(var.private_subnets)}"
  subnet_id = "${element(aws_subnet.private_subnets.*.id,count.index)}"
  route_table_id = aws_route_table.module_privateRT.id
  }