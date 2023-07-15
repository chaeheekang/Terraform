variable vpc_id {
  type = string
}
variable ami {
  type = string
}
variable instance_type {
  type = string
} 
variable ec2_subnet_id {
  type = list(string)
  default = []
}
variable was_subnet_id {
  type = list(string)
  default = []
}
variable vpc_security_group_ids {
  type = list(string)
  default = []
}
variable was_security_group_ids {
  type = list(string)
  default = []
}
variable key_name {
  type = string
}
variable ec2_name {
  type = list(string)
  default = []
}
variable was_name {
  type = list(string)
  default = []
}

variable elb_name {
  type = list(string)
  default = []
}

variable ex_elb_security_groups {
  type = list(string)
  default = []
}
variable in_elb_security_groups {
  type = list(string)
  default = []
}
variable ex_elb_subnets {
  type = list(string)
  default = []
}