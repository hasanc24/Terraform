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
} 
}

#Deploy the public subnets
resource "aws_subnet" "public_subnets" {
for_each
vpc_id
cidr_block
= var.public_subnets
= aws_vpc.vpc.id
= cidrsubnet(var.vpc_cidr, 8, each.value + 100)
 availability_zone       = tolist(data.aws_availability_zones.available.
   names)[each.value]
map_public_ip_on_launch = true
tags = {
  Name      = each.key
     Terraform = "true"
  }
}

#Create route tables for public and private subnets resource "aws_route_table" "public_route_table" {
 vpc_id = aws_vpc.vpc.id
route {
  cidr_block     = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.internet_gateway.id
   #nat_gateway_id = aws_nat_gateway.nat_gateway.id
}
tags = {
  Name      = "demo_public_rtb"
  Terraform = "true"
}
 }
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
 cidr_block     = "0.0.0.0/0"
# gateway_id     = aws_internet_gateway.internet_gateway.id


 
nat_gateway_id = aws_nat_gateway.nat_gateway.id
}
tags = {
  Name      = "demo_private_rtb"
  Terraform = "true"
}
}