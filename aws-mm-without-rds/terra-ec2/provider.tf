terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
  shared_config_files = ["/home/developer/.aws/config"]
  shared_credentials_files = ["/home/developer/.aws/credentials"]
  profile = "mmkathriniam"
}
