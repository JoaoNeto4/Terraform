terraform {
  #https://developer.hashicorp.com/terraform/language/state
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
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
