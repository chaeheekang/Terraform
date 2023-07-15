resource "aws_alb" "seoul1_alb" {
  internal                         = false
  load_balancer_type               = "application"
  subnets                          = [aws_subnet.seoul1-public-1.id, aws_subnet.seoul1-public-2.id]
  enable_cross_zone_load_balancing = true
  tags = {
    Name = "seoul1_alb"
  }
}