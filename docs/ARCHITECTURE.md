# Infrastructure Architecture

## Overview
The infrastructure is designed to host a simple web application on AWS.

## Architecture Diagram (Logical)

VPC
├── Public Subnet A
│ └── EC2 Web Server 1
├── Public Subnet B
│ └── EC2 Web Server 2
├── S3 Bucket (Static Content)
└── IAM Roles & Policies


## Components
- VPC with public subnets
- Two EC2 instances acting as web servers
- S3 bucket for static assets
- IAM roles and policies for secure access


### S3 Bucket Configuration

An S3 bucket was created with versioning, server-side encryption (SSE-S3), and
public access fully blocked. Lifecycle policies transition objects to
Standard-IA after 30 days, Glacier after 90 days, and delete after 180 days.
Server access logging is enabled and sent to a separate logging bucket.
