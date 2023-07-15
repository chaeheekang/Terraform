# VPC
variable "vpc_cidr_block" {
  type = string
}
variable "public_subnet_cidr_blocks" {
  type = list(string)
  default = []
}
variable "private_subnet_cidr_blocks" {
  type = list(string)
  default = []
}
variable "availability_zones" {
  type = list(string)
  default = []
}
variable "vpc_name" {
  type = string
}
variable "igw_name" {
  type = string
}
variable "public_subnet_name" {
  type = list(string)
  default = []
}
variable "private_subnet_name" {
  type = list(string)
  default = []
}

# EIP
variable "eip_name" {
  type = string
}

# NAT Gateway
variable "nat_name" {
  type = string
}

#Route
variable "route_name" {
  type = list(string)
  default = []
}

#Securiy Group
variable "sg_list" {
  type = list(string)
  default = []
}