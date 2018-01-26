variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "vpc_name" {
  default = "jenkins-training"
}

variable "pub_key_path" {
  default = "id_rsa.pub"
}

variable "aws_region_os" {
  default = "us-east-1-ubuntu"
}
