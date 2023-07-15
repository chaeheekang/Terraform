
# data "aws_subnet" "public_subnet" {
#   filter {
#     name   = "tag:Name"
#     values = ["2a-public-1"]
#   }
# }

resource "aws_nat_gateway" "name" {
  allocation_id = aws_eip.eip.id
  #subnet_id = data.aws_subnet.public_subnet.id
  subnet_id = aws_subnet.public[0].id
  tags = {
    Name = var.nat_name
  }
}