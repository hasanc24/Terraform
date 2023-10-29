provider "aws" {
  region = "us-east-1"
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Prod-subnet"
  }
}

resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Production"
  }
}

resource "aws_instance" "My-First-Server" {
  ami           = "ami-0dbc3d7bc646e8516"
  instance_type = "t2.micro"
  tags = {
    Name = "My-First-Sever"
  }
}

resource "aws_vpc" "second-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "dev"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.second-vpc.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "dev-subnet"
  }
}
