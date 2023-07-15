resource "aws_db_subnet_group" "adsg" {
  subnet_ids = var.subnets
  tags = {
    Name = var.db_subnet_group_name
  }
}
resource "aws_db_instance" "db" {
  engine = "mysql"
  instance_class = "db.t2.micro"
  allocated_storage = 10
  storage_type = "gp2"
  publicly_accessible = false
  availability_zone = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.adsg.name
  username = "kch"
  password = "CC3rdseson2!"
  skip_final_snapshot = true
}