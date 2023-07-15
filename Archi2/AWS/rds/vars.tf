variable rds_subnet_group {
    type = string
}
variable db_subnet_ids {
    type = list(string)
    default = []
}
variable db_vpc_security_group_ids {
    type = list(string)
    default = []
}