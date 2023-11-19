resource "aws_vpc" "main" {
  cidr_block          = "10.0.0.0/16"
  enable_dns_hostname = true
  enable_dns_support  = true

  tags = {
    Name = "Dev"
  }
}