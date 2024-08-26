terraform {
  required_version = ">= 1.0.0"

  #https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.115.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "joaonetoterraformstate"
    container_name       = "remote-state"
    key                  = "for-each/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
