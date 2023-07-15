resource "aws_autoscaling_group" "asg-seoul1" {
  min_size                  = 3
  max_size                  = 5
  desired_capacity          = 3
  #availability_zones        = ["ap-northeast-2a","ap-northeast-2c"]
  launch_configuration      = aws_launch_configuration.ec2_seoul1.name
  vpc_zone_identifier       = [aws_subnet.seoul1-public-1.id, aws_subnet.seoul1-public-2.id]
}

resource "aws_launch_configuration" "ec2_seoul1" {
  name = "ch_seoul1_ec2"

  image_id      = "ami-063db2954fe2eec9f"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykeypair.key_name

  associate_public_ip_address = true

  user_data                   = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg-seoul2" {
  min_size                  = 3
  max_size                  = 5
  desired_capacity          = 3
  #availability_zones        = ["ap-northeast-2a","ap-northeast-2c"]
  launch_configuration      = aws_launch_configuration.ec2_seoul2.name
  vpc_zone_identifier       = [aws_subnet.seoul2-public-1.id, aws_subnet.seoul2-public-2.id]
}

resource "aws_launch_configuration" "ec2_seoul2" {
  name = "ch_seoul2_ec2"

  image_id      = "ami-063db2954fe2eec9f"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykeypair.key_name

  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}