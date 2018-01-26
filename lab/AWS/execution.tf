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

module "jenkins_setup_sg" {
  source            = "github.com/opstree-terraform/security_group_rule"
  from_port         = "22"
  to_port           = "22"
  protocol          = "tcp"
  security_group_id = "${module.jenkins_vpc.default_sg_id}"
}

module "jenkins_setup_sg_http" {
  source            = "github.com/opstree-terraform/security_group_rule"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = "${module.jenkins_vpc.default_sg_id}"
}

module "server" {
  source = "github.com/opstree-terraform/ec2"

  subnet_id          = "${module.pub_subnet.id}"
  aws_region         = "${var.aws_region}"
  aws_region_os      = "${var.aws_region_os}"
  name               = "${var.vpc_name}-sandeep.rawat"
  type               = "t2.nano"
  key_pair_id        = "${module.jenkins_setup_key_pair.id}"
  security_group_ids = ["${module.jenkins_vpc.default_sg_id}"]
  zone_id            = "${module.jenkins_vpc.zone_id}"
}
