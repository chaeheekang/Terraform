resource "aws_elasticache_subnet_group" "seoul1_elasticache_group" {
  name       = "seoul1-elasticache-subnet-group"
  subnet_ids = [aws_subnet.seoul1-public-1.id, aws_subnet.seoul1-public-2.id]
  description = "Elasticache subnet group for Seoul1 region"
}
resource "aws_elasticache_cluster" "seoul1_elasticache1" {
  cluster_id           = "seoul1-elasticache1"
  engine               = "redis"  # ElastiCache 엔진에 맞게 변경
  node_type            = "cache.t2.micro"  # 노드 유형에 맞게 변경
  num_cache_nodes      = 1  # 캐시 노드 수에 맞게 변경
  subnet_group_name    = aws_elasticache_subnet_group.seoul1_elasticache_group.name
}
# resource "aws_elasticache_cluster" "seoul1_elasticache2" {
#   cluster_id           = "seoul1-elasticache2"
#   engine               = "redis"  # ElastiCache 엔진에 맞게 변경
#   node_type            = "cache.t2.micro"  # 노드 유형에 맞게 변경
#   num_cache_nodes      = 1  # 캐시 노드 수에 맞게 변경
#   subnet_group_name    = aws_elasticache_subnet_group.seoul1_elasticache_group.name
# }