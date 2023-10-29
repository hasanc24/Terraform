provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "My-Frist-VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Production"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.My-Frist-VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Prod-subnet"
  }
}

resource "aws_instance" "My-First-Server" {
  ami           = "ami-0dbc3d7bc646e8516"
  instance_type = "t2.micro"
  tags = {
    name = "My-First-Sever"
  }
}












