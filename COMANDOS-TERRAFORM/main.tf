#https://developer.hashicorp.com/terraform/cli/commands/state
#https://developer.hashicorp.com/terraform/cli/commands/show
#https://developer.hashicorp.com/terraform/cli/commands/import
#https://developer.hashicorp.com/terraform/cli/import/usage
#https://developer.hashicorp.com/terraform/cli/commands/init
#https://developer.hashicorp.com/terraform/cli/commands/force-unlock
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }

  backend "s3" {
    #for automation in pipelines review class 40 chapter 5
    #backend-dev.hcl
    #backend-prod.hcl
    bucket = "joaoneto-remote-state"
    key    = "commands/terraform.tfstate"
    region = "us-west-2"
  }
  /*
  saves an Azure backend that will save the state of a code that is being deployed to AWS
  backend "azure" {
    resource_group_name = "rg-remote-state"
    storage_account_name    = "joaonetoterraformstate"
    container_name = "remote-state"
    key = "comandos/terraform.tfstate"
  }
  */
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