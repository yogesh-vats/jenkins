provider "aws" {
  region = "${var.aws_region}"
}

module "jenkins_vpc" {
  source = "github.com/opstree-terraform/vpc.git"
  cidr   = "${var.vpc_cidr}"
  name   = "${var.vpc_name}"
}

resource "aws_subnet" "subnet" {
  vpc_id            = "${module.jenkins_vpc.id}"
  cidr_block        = "${var.subnet_cidr}"
  availability_zone = "${var.aws_region}a"

  tags {
    Name = "${var.vpc_name}-public-sn"
  }
}
