# Terraform Infrastructure – DevOps Review Lab

This directory contains Terraform code to provision AWS infrastructure
using reusable modules and multiple environments.

## Structure

- modules/
  - vpc/    : VPC, subnets, internet gateway, routing
  - ec2/    : EC2 instances, security groups, IAM role attachment
  - s3/     : S3 buckets with versioning, encryption, lifecycle rules

- environments/
  - dev/    : Development environment
  - prod/   : Production environment

## Key Concepts Used

- Terraform modules
- Environment separation (dev/prod)
- Remote backend (S3)
- Variables and outputs
- Reusable and scalable design
