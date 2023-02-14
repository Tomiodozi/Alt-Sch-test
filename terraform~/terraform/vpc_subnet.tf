#create a virtual private network
#create vpc
resource "aws_vpc" "mainvpc" {
  cidr_block = "10.0.0.0/16"
  # instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "alt"
  }
}
#create public subnet in VPC
resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.mainvpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Sub1"
  }
}
resource "aws_subnet" "sub2" {
  vpc_id                  = aws_vpc.mainvpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "Sub2"
  }
}
resource "aws_subnet" "sub3" {
  vpc_id                  = aws_vpc.mainvpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "Sub3"
  }
}

#create internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mainvpc.id

  tags = {
    Name = "IGW"
  }
}
#routetable for internet gateway
resource "aws_default_route_table" "route" {
  default_route_table_id = aws_vpc.mainvpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "igw"
  }
}