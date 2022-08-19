variable "vpc_ID" {
  type = string
}

variable "aws-ami" {
  type = string
}

variable "keyname" {
  type = string
}

variable "az" {
    type = string
    default = "eu-central-1a"
}