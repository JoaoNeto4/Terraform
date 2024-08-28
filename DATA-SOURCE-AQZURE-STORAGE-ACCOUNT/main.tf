#https://learn.microsoft.com/pt-br/cli/azure/install-azure-cli
#https://developer.hashicorp.com/terraform/language/data-sources
terraform {
  required_version = ">= 1.4.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "joaonetoterraformstate"
    container_name       = "remote-state"
    key                  = "data-source/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

