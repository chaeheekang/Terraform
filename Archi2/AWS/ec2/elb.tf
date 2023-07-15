#External-ELB 생성
resource "aws_alb" "ex-elb" {
    name = var.elb_name[0]
    subnets = var.ex_elb_subnets
    security_groups = var.ex_elb_security_groups
    load_balancer_type = "application"
    tags = {
        Name = var.elb_name[0]
    }
}
#External-ELB Target Group 생성
resource "aws_lb_target_group" "ex-tg" {
    name = "ch-ex-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        interval = 30
        path = "/"
    }
}
#타겟그룹에 타겟 설정
resource "aws_lb_target_group_attachment" "ex-tg-attachment" {
    count = 2 
    target_group_arn = aws_lb_target_group.ex-tg.arn
    target_id = aws_instance.ec2[count.index+1].id # name = ["bastion","2a-web1","2c-web1"] 이렇게 들어있음
    port = 80
}

# ALB Listerner 생성
resource "aws_lb_listener" "web" {
    load_balancer_arn = aws_alb.ex-elb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.ex-tg.arn
    }
}

#Internal-ELB Target Group 생성
resource "aws_alb" "in-elb" {
    name = var.elb_name[1]
    subnets = var.was_subnet_id
    security_groups = var.in_elb_security_groups
    #load_balancer_type = "application"
    internal = true
    tags = {
        Name = var.elb_name[1]
    }
}
#Internal-ELB Target Group 생성
resource "aws_lb_target_group" "in-tg" {
    name = "ch-in-tg"
    port = 8080
    protocol = "HTTP"
    vpc_id = var.vpc_id

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        interval = 30
        path = "/"
    }
}
#타겟그룹에 타겟 설정
resource "aws_lb_target_group_attachment" "in-tg-attachment" {
    count = 2 
    target_group_arn = aws_lb_target_group.in-tg.arn
    target_id = aws_instance.was[count.index].id 
    port = 8080
}
# ALB Listerner 생성
resource "aws_lb_listener" "was" {
    load_balancer_arn = aws_alb.in-elb.arn
    port = "8080"
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.in-tg.arn
    }
}