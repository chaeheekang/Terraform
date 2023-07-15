resource "aws_ec2_transit_gateway" "transit_gateway" {
  description = "Transit Gateway"

  tags = {
    Name = "transit-gateway"
  }
}
# # Create VPC Transit Gateway
# resource "aws_ec2_transit_gateway" "transit_gateway" {
#   description  = "VPC Transit Gateway"
#   auto_accept_shared_attachments = "enable"
#   default_route_table_association = "enable"
#   default_route_table_propagation = "enable"
# }
#Create VPC Transit Gateway Attachment for each VPC
# resource "aws_ec2_transit_gateway_vpc_attachment" "transit_gateway_attachment" {
#   count              = length(var.vpc_ids)
#   subnet_ids         = [aws_subnet[var.vpc_ids[count.index]].private_subnet_ids[count.index]]
#   transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
#   vpc_id             = var.vpc_ids[count.index]
# }
resource "aws_ec2_transit_gateway_vpc_attachment" "seoul1_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.seoul1.id
  subnet_ids = [aws_subnet.seoul1-public-1.id,aws_subnet.seoul1-public-2.id]
  dns_support        = "enable"
  tags = {
      Name = "seoul1_attachment"
  }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "seoul2_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.seoul2.id
  subnet_ids = [aws_subnet.seoul2-public-1.id,aws_subnet.seoul2-public-2.id]
  dns_support        = "enable"
  tags = {
      Name = "seoul2_attachment"
  }
}
resource "aws_ec2_transit_gateway_vpc_attachment" "seoul3_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = aws_vpc.seoul3.id
  subnet_ids = [aws_subnet.seoul3-public-1.id,aws_subnet.seoul3-public-2.id]
  dns_support        = "enable"
  tags = {
      Name = "seoul3_attachment"
  }
}
