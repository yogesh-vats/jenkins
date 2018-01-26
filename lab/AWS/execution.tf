provider "aws" {
  region = "${var.aws_region}"
}

module "jenkins_vpc" {
  source   = "./vpc"
  vpc_name = "${var.vpc_name}"
  vpc_cidr = "${var.vpc_cidr}"
}

resource "aws_subnet" "subnet" {
  vpc_id            = "${module.jenkins_vpc.vpc_id}"
  cidr_block        = "${var.subnet_cidr}"
  availability_zone = "${var.aws_region}a"

  tags {
    Name = "${var.vpc_name}-public-sn"
  }
}
