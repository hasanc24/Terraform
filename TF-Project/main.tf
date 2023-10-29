#1 Create a VPC
#2 Create Internet Gateway
#3 Create Custom Route Table
#4 Create a Subnet
#5 Associate subnet with Route Table
#6 Create a Security Group to allow port 22, 80, 443
#7 Create a network interface with an IP in the subnet that was created in step #4
#8 Assign an elastic IP to the network interface created in step #7 
#9 Create Ubuntu server and install/enable apache2

provider "aws" {
  region = "us-east-1"
}

#Create a VPC 
resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"
}

#Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "main"
  }
}