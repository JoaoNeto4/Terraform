terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.62.0"
    }
  }
}

provider "aws" {
  #https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html
  region = "sa-east-1"

  default_tags {
    tags = {
      owner     = "joaoneto"
      mnaged-by = "terraform"
    }
  }
}