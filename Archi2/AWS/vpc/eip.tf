# Elastic IP 생성
resource "aws_eip" "eip" {
  vpc = true
  #instance = aws_instance.web.id
  tags = {
    Name = var.eip_name
  }
}