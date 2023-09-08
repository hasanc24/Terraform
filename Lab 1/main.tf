# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

#Retrieve the list of AZs in the current AWS region
data "aws_availability_zones" "available" {}
data "aws_region" "current" {}
#Define the VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
tags = {
  Name        = var.vpc_name
  Environment = "demo_environment"
  Terraform   = "true"
}
}

#Deploy the private subnets
resource "aws_subnet" "private_subnets" {
for_each
vpc_id
cidr_block
availability_zone = tolist(data.aws_availability_zones.available.names)[
each.value]
= var.private_subnets
= aws_vpc.vpc.id
= cidrsubnet(var.vpc_cidr, 8, each.value)
tags = {
    Name      = each.key
    Terraform = "true"
} }

