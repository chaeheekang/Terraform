#privaet subnet에 대한 route table
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.name.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
    }
    tags = {
        Name = var.route_name[0]
    }
}
#privaet subnet에 대한 route table
resource "aws_route_table" "private" {
    vpc_id = aws_vpc.name.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.name.id
    }
    tags = {
        Name = var.route_name[1]
    }
}

#라우팅 테이블에 public subnet 추가
resource "aws_route_table_association" "public" {
    count = length(var.public_subnet_cidr_blocks)
    subnet_id = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public.id
}
#라우팅 테이블에 private subnet 추가
resource "aws_route_table_association" "private" {
    count = length(var.private_subnet_cidr_blocks)
    subnet_id = aws_subnet.private[count.index].id
    route_table_id = aws_route_table.private.id
}