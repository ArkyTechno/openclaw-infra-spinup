variable "aws_region" {
  default = "ap-southeast-1"
}

variable "key_name" {}

variable "my_ip" {
  description = "Your IP in CIDR (example: 1.2.3.4/32)"
}

variable "ami_id" {
  description = "Ubuntu 22.04 AMI"
}
