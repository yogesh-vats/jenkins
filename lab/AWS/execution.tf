provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc" "jenkins-training-vpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "${var.vpc_name}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.jenkins-training-vpc.id}"

  tags {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_route" "public_internet_gateway_route" {
  route_table_id         = "${aws_vpc.jenkins-training-vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}
