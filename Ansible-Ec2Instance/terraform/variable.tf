variable "availability_zone" {
  type = string
  default = "eu-central-1a"
}

// aws ec2 describe-vpcs will show you what there is
variable "vpcID" {
  type = string
}

// get this from a previous instance using
// aws --profile=mmkathriniam ec2 describe-instances
variable "ami" {
  type =  string
  default = "ami-065deacbcaac64cf2"
}

// this is the name of a key pair
// you can see the ones that exist using aws ec2 describe-key-pairs
variable "keypair" {
  type = string
  default = "kathrin-mm-access-key"
}

