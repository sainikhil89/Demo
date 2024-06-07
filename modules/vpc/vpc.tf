resource "aws_vpc" "module_vpc" {
cidr_block = "${var.vpc_cidr}"
enable_dns_hostnames = true
  tags = {
    Name = "${var.env}-vpc"
    environment = "${var.environment}"

  }
}

resource "aws_internet_gateway" "module_igw"{
  vpc_id = aws_vpc.module_vpc.id
  tags = {
    Name = "${var.env}-igw"
  }
}