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

variable "instance_type" {
  type = string
}

locals {
  project_name = "BlackMamba"
  }

resource "aws_instance" "my_server" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = var.instance_type

  tags = {
    Name = "MyServer${local.project_name}"
  }
}

outputs "instance_ip_addr" {
  value = aws_instance.server.private_ip
}
