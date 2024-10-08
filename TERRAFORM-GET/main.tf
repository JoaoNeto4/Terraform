#https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/latest
#https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws/latest
#https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
#https://developer.hashicorp.com/terraform/cli/commands/get
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.1.0"
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.8.2"
}

module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"
}
