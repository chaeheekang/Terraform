variable "asg_name" {
  type = string
}
variable "min_size" {
  type = number
}
variable "max_size" {
  type = number
}
variable "desired_capacity" {
  type = number
}
variable "launch_configuration_name" {
    type = string
}
variable "vpc_zone_identifier" {
  type = list(string)
}
variable "image_id" {
    type = string
}
variable "instance_type" {
    type = string
}
variable "key_name" {
    type = string
}