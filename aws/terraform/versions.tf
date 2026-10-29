terraform {
  # Require Terraform 1.5 or later.
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Use the AWS region provided in terraform.tfvars.
provider "aws" {
  region = var.aws_region
}