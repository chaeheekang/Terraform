output "vpc_id" {
  value = aws_vpc.name.id
}
output "public_subnet_id" {
  value = aws_subnet.public.*.id
}
output "private_subnet_id" {
  value = aws_subnet.private.*.id
}
output "internet_gateway" {
  value = aws_internet_gateway.name.id 
}