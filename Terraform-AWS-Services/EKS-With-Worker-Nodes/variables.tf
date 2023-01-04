# =================================================================
# LOCALS AND VARIABLES
# =================================================================

locals {

  common_tags = {
    managed_by = "Terraform"
    project    = "${var.project}"
  }

  bucket_name = lower(var.bucket_name)
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
  default     = "sns-tfstate-AWS-DevOpsTheHardWay"
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

variable "subnet_id_1" {
  type    = string
  default = "subnet-017dade9728b1b09a"
}

variable "subnet_id_2" {
  type    = string
  default = "subnet-02ab81a3423bbff93"
}
