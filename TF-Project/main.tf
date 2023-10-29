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
  region     = "us-west-2"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}
#Create a VPC 
resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "production"
  }
}

#Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.prod-vpc.id

  tags = {
    Name = "prod"
  }
}

#Create custom Route Table  
resource "aws_route_table" "prod-route-table" {
  vpc_id = aws_vpc.prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "prod"
  }
}

#Create a Subnet  
resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.prod-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prod_subnet"
  }
}

#Associate subnet with Route Table
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.prod-route-table.id
}

#Create Security Group to allow port 22, 80, 443
resource "aws_security_group" "allow_web" {
  name        = "allow_web-traffic"
  description = "Allow Web inbound traffic"
  vpc_id      = aws_vpc.prod-vpc.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "SSH"
    from_port   = 2
    to_port     = 2
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_Web"
  }
}

#Create a Network Internet with an IP in the subnet that we created in Step #4
resource "aws_network_interface" "web-server-nic" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_web.id]
}

