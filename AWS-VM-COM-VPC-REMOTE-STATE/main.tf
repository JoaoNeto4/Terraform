#https://developer.hashicorp.com/terraform/language/functions/file
#https://developer.hashicorp.com/terraform/language/settings/backends/s3#data-source-configuration
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }

  backend "s3" {
    bucket = "joaoneto-remote-state"
    key    = "aws-vm/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      owner      = "joaoneto"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  /*
    'key' resource name of previous module used in AWS-VPC 
  */
  backend = "s3"
  config = {
    bucket = "joaoneto-remote-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-west-2"
  }
}
