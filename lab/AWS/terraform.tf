variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc" "jenkins-training-vpc" {
  cidr_block = "${var.vpc_cidr}"
}
