#https://developer.hashicorp.com/terraform/language/settings/backends/s3
#https://developer.hashicorp.com/terraform/language/meta-arguments/module-providers
#https://developer.hashicorp.com/terraform/language/meta-arguments/resource-provider
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
    key    = "provider/terraform.tfstate"
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

provider "aws" {
  alias = "eua"

  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "joaoneto"
      managed-by = "terraform"
    }
  }
}

provider "aws" {
  alias = "australia"

  region = "ap-southeast-2"

  default_tags {
    tags = {
      owner      = "joaoneto"
      managed-by = "terraform"
    }
  }
}

module "vpc" {
  providers = {
    aws.provider_1 = aws.eua
    aws.provider_2 = aws.australia
  }

  source = "./vpc"
}
