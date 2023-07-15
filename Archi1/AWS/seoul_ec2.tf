# resource "aws_instance" "seoul_ec2_01" {
#   ami           = var.AMIS[var.seoul_region]
#   instance_type = "t2.micro"

#   # the VPC subnet
#   subnet_id = aws_subnet.seoul-public-1.id

#   # the security group
#   # vpc_security_group_ids = [aws_security_group.allow-ssh.id]

#   # the public SSH key
#   key_name = aws_key_pair.mykeypair.key_name
# }
