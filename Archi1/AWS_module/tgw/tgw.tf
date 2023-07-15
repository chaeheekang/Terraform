resource "aws_ec2_transit_gateway" "transit_gateway" {
  description = "Transit Gateway"

  tags = {
    Name = "transit-gateway"
  }
}
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id             = var.vpc_ids
  subnet_ids         = var.subnet_ids
  dns_support        = "enable"
  tags = {
      Name = var.tgw_attachment_name
  }
}