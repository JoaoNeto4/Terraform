#https://developer.hashicorp.com/terraform/language/settings/backends/azurerm
terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.49.0"
    }
  }

  backend "azurerm" {
    /*
      resource_group_name name of the previous module used in AWS-AZURE-REMOTE-STATE
      storage_account_name name of the previous module used in AWS-AZURE-REMOTE-STATE
      container_name name of the previous module used in AWS-AZURE-REMOTE-STATE
      directory/name_tfstate
    */
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "joaonetoterraformstate"
    container_name       = "remote-state"
    key                  = "azure-vnet/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
