#https://developer.hashicorp.com/terraform/cli/commands/state
#https://developer.hashicorp.com/terraform/cli/commands/show
#https://developer.hashicorp.com/terraform/cli/commands/import
#https://developer.hashicorp.com/terraform/cli/import/usage
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
    key    = "commands/terraform.tfstate"
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