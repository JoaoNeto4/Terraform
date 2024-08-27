#https://developer.hashicorp.com/terraform/language/settings/backends/s3
#https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }

  backend "s3" {
    /*
    bucket name of the previous module and pay attention 
    to 'region' used in AWS-AZURE-REMOTE-STATE
    */
    bucket = "joaoneto-remote-state"
    key    = "dinamic-block/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      owner      = "danielgil"
      managed-by = "terraform"
    }
  }
}
