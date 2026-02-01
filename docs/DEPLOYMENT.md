# Deployment Guide

## Step 1: Configure AWS
Ensure AWS CLI is configured with valid credentials.

## Step 2: Provision Infrastructure
Navigate to the terraform directory and apply the configuration.

## Step 3: Configure Servers
Run Ansible playbooks to configure EC2 instances.

## Step 4: Verify
Access the web servers via their public IP addresses.

### Elastic IP Assignment

An Elastic IP was allocated and associated with the EC2 instance to provide
a static public IP address. The assigned Elastic IP was documented and later
released to avoid unnecessary AWS charges.

