# Configure the AWS Provider
provider "aws" {
    region = "us-east-1"
}

#Retrieve the lists of AZs in the current AWS Region 
data "aws_availability_zones" "available" {}
data "aws_region" "current" {}

Define the VPC
resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
        Environment = "demo_environment"
        Terraform = "true"
    }
}

#Deploy the Private subnets 
