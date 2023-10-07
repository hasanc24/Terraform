# Configure the AWS Provider 
provider "aws" {
    region = "us-east-1"
}

#Retrieve the list of AZs in the current AWS region 
data "aws_availablity_zones" "available" {}
data "aws_region" "current"{}

# Define the VPC 
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc.cidr
    tags = {
        Name = var.vpc_name
        Environment = "demo_environment"
        Terraform = "true"
    }
}

