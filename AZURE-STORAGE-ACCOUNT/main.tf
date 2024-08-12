terraform {
  required_version = ">= 1.0.0"

  #https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.115.0"
    }
  }
}

provider "azurerm" {
  features {}
}

