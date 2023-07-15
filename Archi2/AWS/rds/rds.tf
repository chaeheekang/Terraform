resource "aws_db_instance" "rds" {
  identifier = "rds"
  engine = "mysql"
  instance_class = "db.t2.micro"
  allocated_storage = 10
  storage_type = "gp2"
  publicly_accessible = false
  availability_zone = "ap-northeast-2a"
  db_subnet_group_name = aws_db_subnet_group.subnet-group.name
  vpc_security_group_ids = var.db_vpc_security_group_ids
  username = "kch"
  password = "CC3rdseson2!"
  skip_final_snapshot = true
}