provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "My-First-Server" {
  ami           = "ami-0dbc3d7bc646e8516"
  instance_type = "t2.micro"
  tags = {
    name = "My-First-Sever"
  }
}








