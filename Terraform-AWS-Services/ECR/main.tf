# =================================================================
# Terraform Settings & Provider Configuration 
# =================================================================

terraform {
  backend "s3" {
    bucket = "sns-tfstate-aws-devopsthehardway"
    key    = "ecr-terraform.tfstate"
    region = "eu-west-2"
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}


# =================================================================
# Resources 
# =================================================================

resource "aws_ecr_repository" "DevOpsTheHardWay-repo" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}