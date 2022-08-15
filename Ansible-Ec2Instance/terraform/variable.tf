variable "availability_zone" {
  type = string
  default = "eu-central-1a"
}

variable "vpcID" {
  type = string
  default = "vpc-024c416e13ffa7981"
}

variable "ami" {
  type =  string
  default = "ami-065deacbcaac64cf2"
}

variable "keypair" {
  type = string
  default = "ansible"
}

