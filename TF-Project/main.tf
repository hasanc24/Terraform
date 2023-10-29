provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "My-Frist-VPC" {
  cidr_block = "10.0.0.0/16"
    tags = {
    Name = "Production-VPC"
  }
}

resource "aws_instance" "My-First-Server" {
  ami           = "ami-0dbc3d7bc646e8516"
  instance_type = "t2.micro"
  tags = {
    name = "My-First-Sever"
  }
}











