# 1 VPC, 1 Subnet, 1 Security Group


resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

    tags = {
        Name = "main-vpc"
    }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = "ca-central-1a"

  tags = {
    Name = "public-subnet 1"
  }
}


resource "aws_security_group" "sg" {
  vpc_id            = aws_vpc.main.id
  name = "my-sg"
  description = "public security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}