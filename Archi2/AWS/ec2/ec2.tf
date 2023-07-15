# ec2 생성
resource "aws_instance" "ec2" {
    count = length(var.ec2_name)
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.ec2_subnet_id[count.index]
    vpc_security_group_ids = [var.vpc_security_group_ids[count.index]]
    key_name = var.key_name
    
    associate_public_ip_address = false
    
    tags = {
        Name = var.ec2_name[count.index]
    }
}

# was 생성
resource "aws_instance" "was" {
    count = length(var.was_subnet_id)
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.was_subnet_id[count.index]
    vpc_security_group_ids = var.was_security_group_ids
    key_name = var.key_name
    
    associate_public_ip_address = false
    
    tags = {
        Name = var.was_name[count.index]
    }
}