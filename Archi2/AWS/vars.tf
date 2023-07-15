# 키 경로 추가
variable "PATH_TO_PRIVATE_KEY" {
  default = "./key/mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "./key/mykey.pub"
}

# region 추가
variable "REGION" {
  type = list(string)
  default = ["ap-northeast-2a","ap-northeast-2c"]
}

# # AMI 변수
# # Ubuntu 22.04LTS
# variable "AMIS" {
#   type = map(string)
#   default = {
#     ap-northeast-2 = "ami-0c9c942bd7bf113a2"
#   }
# }
