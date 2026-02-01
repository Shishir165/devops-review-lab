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
