terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.7"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  shared_credentials_file = "/home/quangcao/.aws/credentials"
  profile = "mmuser@quangcaoiam"
  
}
