# =================================================================
# Provider Configuration 
# =================================================================


provider "aws" {
  region = var.aws_region
}


# =================================================================
# S3 Bucket Configuration
# =================================================================

resource "aws_s3_bucket" "terraform_state" {
  bucket = lower(var.bucket_name)

  tags = local.common_tags
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }
}


# =================================================================
# LOCALS AND VARIABLES
# =================================================================

locals {

  common_tags = {
    managed_by = "Terraform"
    project    = "${var.project}"
  }
}

variable "bucket_name" {
  type = string
  description = "S3 bucket name"
  default = "sns-tfstate-AWS-DevOpsTheHardWay"
}

variable "project" {
  type        = string
  description = "project name"
  default     = "AWS-DevOpsTheHardWay"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "eu-west-2"
}