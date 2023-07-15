# 지역 변수 추가
variable "seoul_region" {
  description = "AWS region for Seoul"
  default     = "ap-northeast-2"
}
variable "vpc_ids" {
  type    = list(string)
  default = ["seoul1", "seoul2", "seoul3"]  # Replace with your VPC IDs
}
# 키 경로 추가
variable "PATH_TO_PRIVATE_KEY" {
  default = "./key/mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "./key/mykey.pub"
}

# AMI 변수
# Ubuntu 22.04LTS
variable "AMIS" {
  type = map(string)
  default = {
    ap-northeast-2 = "ami-0c9c942bd7bf113a2"
  }
}