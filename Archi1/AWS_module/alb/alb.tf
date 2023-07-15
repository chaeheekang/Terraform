resource "aws_alb" "alb" {
    internal = false
    load_balancer_type = "application"
    subnets = var.subnets
    enable_cross_zone_load_balancing = true
    tags = {
        Name = var.alb_name
    }
  
}