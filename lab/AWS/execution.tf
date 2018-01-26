provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc" "jenkins-training-vpc" {
  cidr_block = "${var.vpc_cidr}"
}
