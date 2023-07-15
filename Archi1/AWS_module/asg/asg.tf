resource "aws_autoscaling_group" "asg" {
  name = var.asg_name
  min_size  = var.min_size
  max_size = var.max_size
  desired_capacity          = var.desired_capacity
  launch_configuration      = aws_launch_configuration.launch_config.name
  vpc_zone_identifier       = var.vpc_zone_identifier
}
resource "aws_launch_configuration" "launch_config" {
  name_prefix               = var.launch_configuration_name
  image_id                  = var.image_id
  instance_type             = var.instance_type
  key_name                  = var.key_name
  associate_public_ip_address = true

  lifecycle {
    create_before_destroy = true
  }
}