resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "Dev"
  }
}

resource "aws_subnet" "main_public_subnet_1" {
  vpc_id                  = aws_vpc.public_subnet_1.id
  cidr_block              = "10.0.0.0/16"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1"

  tags = {
    Name = "dev-public"
  }
}
