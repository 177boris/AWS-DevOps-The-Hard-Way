terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "sns-tfstate-aws-devopsthehardway"
    key    = "ecr-terraform.tfstate"
    region = "eu-west-2"
  }
}

# Configure aws provider 
provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}
