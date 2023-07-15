variable "subnets" {
  type = list(string)
}
variable "db_subnet_group_name" {
  type = string
}
variable "tgw_attachment_name" {
  type = string
}