# RDS 서브넷 그룹 생성
resource "aws_db_subnet_group" "seoul1_rds_group" {
  name       = "seoul1_rds-subnet-group"
  subnet_ids = [aws_subnet.seoul1-private-1.id,aws_subnet.seoul1-private-2.id]
  tags={
    Name = "seoul1_rds_group"
  }
}

resource "aws_db_instance" "seoul1_rds_01" {
  engine               = "mysql"  # 원하는 데이터베이스 엔진으로 변경하세요.
  instance_class       = "db.t2.micro"  # 적절한 인스턴스 유형으로 변경하세요.
  allocated_storage    = 10  # 적절한 스토리지 크기로 변경하세요.
  storage_type         = "gp2"  # 원하는 스토리지 유형으로 변경하세요.
  publicly_accessible = false
  availability_zone      = "ap-northeast-2a"
  db_subnet_group_name   = aws_db_subnet_group.seoul1_rds_group.name
  username = "kch"
  password = "CC3rdseson2!"
  #multi_az = false
  skip_final_snapshot          = true  # 최종 스냅샷을 생성하지 않을 것임을 나타내는 값으로 변경합니다.
}
