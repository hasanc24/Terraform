terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

variable {
  type = string
}


resource "aws_instance" "my_server" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = var.instance_type

  tags = {
    Name = "MyServer"
  }
}

