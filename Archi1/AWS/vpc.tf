provider "aws" {
  region = var.seoul_region
}

# Internet VPC - 서울1
resource "aws_vpc" "seoul1" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "seoul1"
  }
}

# 서울 Subnets-public 2개,private 2개
resource "aws_subnet" "seoul1-public-1" {
  vpc_id                  = aws_vpc.seoul1.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-2a"

  tags = {
    Name = "seoul1-public-1"
  }
}
resource "aws_subnet" "seoul1-public-2" {
  vpc_id                  = aws_vpc.seoul1.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-2c"

  tags = {
    Name = "seoul1-public-2"
  }
}
resource "aws_subnet" "seoul1-private-1" {
  vpc_id                  = aws_vpc.seoul1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-2a"

  tags = {
    Name = "seoul1-private-1"
  }
}
resource "aws_subnet" "seoul1-private-2" {
  vpc_id                  = aws_vpc.seoul1.id
  cidr_block              = "10.0.11.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-2c"

  tags = {
    Name = "seoul1-private-2"
  }
}

# Internet VPC - 서울2
resource "aws_vpc" "seoul2" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "seoul2"
  }
}
# 서울 Subnets-public 2개,private 2개
resource "aws_subnet" "seoul2-public-1" {
  vpc_id                  = aws_vpc.seoul2.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-2a"

  tags = {
    Name = "seoul2-public-1"
  }
}
resource "aws_subnet" "seoul2-public-2" {
  vpc_id                  = aws_vpc.seoul2.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-2c"

  tags = {
    Name = "seoul2-public-2"
  }
}
resource "aws_subnet" "seoul2-private-1" {
  vpc_id                  = aws_vpc.seoul2.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-2a"

  tags = {
    Name = "seoul2-private-1"
  }
}
resource "aws_subnet" "seoul2-private-2" {
  vpc_id                  = aws_vpc.seoul2.id
  cidr_block              = "10.0.11.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-2c"

  tags = {
    Name = "seoul2-private-2"
  }
}

# Internet VPC - 서울3
resource "aws_vpc" "seoul3" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "seoul3"
  }
}
# 서울 Subnets-public 2개,private 2개
resource "aws_subnet" "seoul3-public-1" {
  vpc_id                  = aws_vpc.seoul3.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-2a"

  tags = {
    Name = "seoul3-public-1"
  }
}
resource "aws_subnet" "seoul3-public-2" {
  vpc_id                  = aws_vpc.seoul3.id
  cidr_block              = "10.0.10.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-northeast-2c"

  tags = {
    Name = "seoul3-public-2"
  }
}
resource "aws_subnet" "seoul3-private-1" {
  vpc_id                  = aws_vpc.seoul3.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-2a"

  tags = {
    Name = "seoul3-private-1"
  }
}
resource "aws_subnet" "seoul3-private-2" {
  vpc_id                  = aws_vpc.seoul3.id
  cidr_block              = "10.0.11.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-northeast-2c"

  tags = {
    Name = "seoul3-private-2"
  }
}