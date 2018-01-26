provider "aws" {
  region = "${var.aws_region}"
}

module "jenkins_vpc" {
  source = "github.com/opstree-terraform/vpc.git"
  cidr   = "${var.vpc_cidr}"
  name   = "${var.vpc_name}"
}

module "jenkins_setup_key_pair" {
  source          = "github.com/opstree-terraform/key_pair.git"
  public_key_path = "${var.pub_key_path}"
  name            = "${var.vpc_name}-key"
}

module "pub_subnet" {
  source                  = "github.com/opstree-terraform/subnet"
  vpc_id                  = "${module.jenkins_vpc.id}"
  cidr                    = "${var.subnet_cidr}"
  az                      = "${var.aws_region}a"
  map_public_ip_on_launch = "true"
}
