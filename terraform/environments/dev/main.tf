terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source   = "../../modules/vpc"
  name     = var.environment
  vpc_cidr = "10.0.0.0/16"
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = "devops-lab-sh-165"
}
module "ec2" {
  source            = "../../modules/ec2"
  name              = "dev-web-shishir"
  ami_id            = "ami-0b12d43e4ab190d54"
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = "sg-087c271d1452b7aa2"
  key_name          = "devops-lab-key-v3"
}

