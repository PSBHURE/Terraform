terraform {
  required_version = "1.12.2"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.76.0"
    }
  }
}

provider "aws" {
  alias = "south-1"
  region = "ap-south-1"
}