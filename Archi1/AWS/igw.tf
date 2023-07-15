# igw.tf
resource "aws_internet_gateway" "seoul1-igw" {
  vpc_id = aws_vpc.seoul1.id
  tags = {
    Name = "seoul1-igw"
  }
}