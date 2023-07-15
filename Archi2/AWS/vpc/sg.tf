resource "aws_security_group" "name" {
    count = length(var.sg_list)
    vpc_id = aws_vpc.name.id
    name = var.sg_list[count.index]
    tags = {
        Name = var.sg_list[count.index]
    }
}
#bastion, web 22
# elb 80

#bastion-sg inbound rule
resource "aws_security_group_rule" "bastion-sg-inbound"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = aws_security_group.name[0].id
}
# web-sg inbound rule
resource "aws_security_group_rule" "web-sg-inbound1"{
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"

    security_group_id = aws_security_group.name[1].id
    source_security_group_id = aws_security_group.name[4].id
}
resource "aws_security_group_rule" "web-sg-inbound2"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = aws_security_group.name[1].id
}
# was-sg inbound rule
resource "aws_security_group_rule" "was-sg-inbound1"{
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"

    security_group_id = aws_security_group.name[2].id
    source_security_group_id = aws_security_group.name[5].id
}
resource "aws_security_group_rule" "was-sg-inbound2"{
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = aws_security_group.name[2].id
}
# db-sg inbound rule
resource "aws_security_group_rule" "db-sg-inbound"{
    type = "ingress"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = aws_security_group.name[3].id
}
# ex-elb-sg inbound rule
resource "aws_security_group_rule" "ex-elb-sg-inbound" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.name[4].id
}
# in-elb-sg inbound rule
resource "aws_security_group_rule" "in-elb-sg-inbound" {
    type = "ingress"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_group_id = aws_security_group.name[5].id
    source_security_group_id = aws_security_group.name[1].id
}
#outbound rule -> 모두 같음
resource "aws_security_group_rule" "outbound"{
    count = length(var.sg_list)
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

    security_group_id = aws_security_group.name[count.index].id
}