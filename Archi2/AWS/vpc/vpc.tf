resource "aws_vpc" "name" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name
  }
}
resource "aws_subnet" "public" {
  count   = length(var.public_subnet_cidr_blocks)
  vpc_id = aws_vpc.name.id
  cidr_block = var.public_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = var.public_subnet_name[count.index]
  }
}
resource "aws_subnet" "private" {
  count   = length(var.private_subnet_cidr_blocks)
  vpc_id = aws_vpc.name.id
  cidr_block = var.private_subnet_cidr_blocks[count.index]
  availability_zone = count.index < 3 ? var.availability_zones[0] : var.availability_zones[1]
  tags = {
    Name = var.private_subnet_name[count.index]
  }
}
resource "aws_internet_gateway" "name" {
  vpc_id = aws_vpc.name.id
  tags = {
    Name = var.igw_name
  }
}