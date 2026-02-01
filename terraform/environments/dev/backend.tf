terraform {
  backend "s3" {
    bucket = "devops-lab-sh-165"
    key    = "terraform/dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}