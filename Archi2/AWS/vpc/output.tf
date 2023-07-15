output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private.*.id
}

output "security_group_ids" {
  value = aws_security_group.name.*.id
}

output "vpc_id" {
  value = aws_vpc.name.id
}