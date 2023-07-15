provider "aws" {
  region = "ap-northeast-2"
}

#vpc
module "vpc" {
  source = "./vpc"
  vpc_cidr_block = "10.0.0.0/16"
  public_subnet_cidr_blocks = ["10.0.0.0/24", "10.0.10.0/24"]
  private_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24","10.0.3.0/24","10.0.11.0/24", "10.0.12.0/24","10.0.13.0/24"]
  availability_zones = var.REGION
  # tags
  vpc_name = "ch-vpc"
  igw_name = "ch-igw"
  public_subnet_name = ["2a-public-1","2c-public-1"]
  private_subnet_name = ["2a-private-1","2a-private-2","2a-private-3","2c-private-1","2c-private-2","2c-private-3"]
  eip_name = "ch-eip"
  nat_name = "ch-nat"
  route_name = ["ch-public-route","ch-private-route"]
  sg_list = ["ch-bastion-sg","ch-web-sg","ch-was-sg","ch-db-sg","ch-ex-elb-sg","ch-in-elb-sg"]
}

#ec2
module "ec2"{
  source = "./ec2"
  # ec2 인스턴스 생성
  ami = "ami-0c9c942bd7bf113a2"
  instance_type = "t2.nano"
  ec2_subnet_id = [module.vpc.public_subnet_ids[0],module.vpc.private_subnet_ids[0],module.vpc.private_subnet_ids[3]]
  was_subnet_id = [module.vpc.private_subnet_ids[1],module.vpc.private_subnet_ids[4]]
  vpc_security_group_ids = [module.vpc.security_group_ids[0],module.vpc.security_group_ids[1],module.vpc.security_group_ids[1]]
  was_security_group_ids = [module.vpc.security_group_ids[2]]
  key_name = aws_key_pair.mykeypair.key_name 

  # elb 인스턴스 생성 - ex, in
  #ex_elb_subnets = [module.vpc.public_subnet_ids[0],module.vpc.public_subnet_ids[1]]
  vpc_id = module.vpc.vpc_id
  ex_elb_subnets = module.vpc.public_subnet_ids
  ex_elb_security_groups = [module.vpc.security_group_ids[4]]  
  in_elb_security_groups = [module.vpc.security_group_ids[5]]

  #tags
  ec2_name = ["bastion","2a-web1","2c-web1"]
  was_name = ["2a-was1","2c-was1"]
  elb_name = ["ch-ex-elb","ch-in-elb"]
}

# rds
module "rds" {
  source = "./rds"
  db_subnet_ids = [module.vpc.private_subnet_ids[2],module.vpc.private_subnet_ids[5]]
  db_vpc_security_group_ids = [module.vpc.security_group_ids[3]]
  #tags
  rds_subnet_group = "ch-rds-subnet-group"
}