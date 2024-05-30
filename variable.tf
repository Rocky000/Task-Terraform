variable "aws_profile" {
  type = string
}

variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0c55b159cbfafe1f0"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_password" {
  default = "password"
}
