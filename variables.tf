variable "AWS_ACCESS_KEY_ID" {
  type = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}


variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "instancetype" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "dvt_key"
}

variable "pub_key" {
  default = "./.ssh/dvt_tools.pub"
}

variable "ec2_count" {
  default = 1
}

variable "tags" {
  type    = list
  default = ["bc1", "bc2"]
}
