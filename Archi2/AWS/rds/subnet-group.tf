# Subnet Group 생성
resource "aws_db_subnet_group" "subnet-group" {
  name       = var.rds_subnet_group
  subnet_ids = var.db_subnet_ids
  tags = {
    Name = var.rds_subnet_group
  }
}
