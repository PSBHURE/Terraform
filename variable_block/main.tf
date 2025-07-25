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
  region = "ap-south-1"
}