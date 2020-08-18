resource "aws_vpc" "myvpc" {
  cidr_block = "${var.cidr_vpc}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "myvpc"
  }
}

#Internet Gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = "${var.vpc_id}"
}

#Public Subnet 1
resource "aws_subnet" "public_subnet1" {
    vpc_id = "${var.vpc_id}"

    cidr_block = "${var.public_subnet1_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "public_subnet1"
    }
}

#Public Subnet 2
resource "aws_subnet" "public_subnet2" {
    vpc_id = "${var.vpc_id}"

    cidr_block = "${var.public_subnet2_cidr}"
    availability_zone = "us-east-1b"

    tags = {
        Name = "public_subnet2"
    }
}

#public route table
resource "aws_route_table" "public_RT" {
    vpc_id = "${var.vpc_id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${var.igw_id}"
    }
tags = {
        Name = "Public RT"
    }
}

#Route Table Association1
resource "aws_route_table_association" "public_RT" {
    subnet_id = "${var.public_subnet_id1}"
    route_table_id = "${var.public_RT_id}"
}


#Private Subnet 1
resource "aws_subnet" "private_subnet1" {
    vpc_id = "${var.vpc_id}"

    cidr_block = "${var.private_subnet1_cidr}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "private_subnet1"
    }
}

#Private Subnet 2
resource "aws_subnet" "private_subnet2" {
    vpc_id = "${var.vpc_id}"

    cidr_block = "${var.private_subnet2_cidr}"

    tags = {
        Name = "private_subnet1"
    }
}

output "vpc_id" {
  value = "${aws_vpc.myvpc.id}"
}

output "public_subnet_id1" {
  value = "${aws_subnet.public_subnet1.id}"
}

output "public_RT_id" {
  value = "${aws_route_table.public_RT.id}"
}

output "igw_id" {
  value = "${aws_internet_gateway.igw.id}"
}

output "private_subnet_id1" {
  value = "${aws_subnet.private_subnet1.id}"
}

output "private_subnet_id2" {
  value = "${aws_subnet.private_subnet2.id}"
}

output "public_subnet_id2" {
  value = "${aws_subnet.public_subnet2.id}"
}