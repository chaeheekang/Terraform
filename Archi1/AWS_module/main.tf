provider "aws" {
  region = "ap-northeast-2"
}

#vpc
module "vpc" {
  count = var.vpc_count
  source = "./vpc"
  vpc_cidr_block = "10.0.0.0/16"
  public_subnet_cidr_blocks = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnet_cidr_blocks = ["10.0.2.0/24", "10.0.3.0/24"]
  availability_zones = var.REGION
  # tags
  vpc_name = "seoul${count.index}-vpc"
  igw_name = "seoul${count.index}-igw"
  public_subnet_name = ["seoul${count.index}-public-1","seoul${count.index}-public-2"]
  private_subnet_name = ["seoul${count.index}-private-1","seoul${count.index}-private-2"]
}
#asg
module "autoscaling" {
  count = var.vpc_count
  source = "./asg"
  asg_name = "seoul${count.index}-asg"
  min_size = 1
  max_size = 3
  desired_capacity = 2
  vpc_zone_identifier = module.vpc[count.index].public_subnet_id
  launch_configuration_name = "ch_seoul${count.index}_ec2"
  image_id = "ami-0c9c942bd7bf113a2"
  instance_type = "t2.nano"
  key_name = aws_key_pair.mykeypair.key_name
}
#alb
module "application_load_valancer" {
  count = var.vpc_count
  source = "./alb"
  subnets = module.vpc[count.index].public_subnet_id
  alb_name = "seoul${count.index}-alb"
}
# #tgw attachment
# module "tgw" {
#   count = var.vpc_count
#   source = "./tgw"
#   vpc_ids = module.vpc[count.index].vpc_id
#   subnet_ids = module.vpc[count.index].public_subnet_id
#   tgw_attachment_name = "seoul${count.index}-tgw-attachment"
# }

#rds
module "db" {
  count = var.vpc_count
  source = "./rds"
  subnets = module.vpc[count.index].private_subnet_id
  #tags
  db_subnet_group_name = "seoul${count.index}-rds-subnet-group"
  tgw_attachment_name = "seoul${count.index}-tgw-attachment"
}

