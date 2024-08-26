#https://developer.hashicorp.com/terraform/language/functions/file
#https://developer.hashicorp.com/terraform/language/settings/backends/azurerm#data-source-configuration
#
#https://registry.terraform.io/modules/Azure/network/azurerm/5.2.0
#
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
    key                  = "azure-vm-modulos-remotos/terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "network" {
  source  = "Azure/network/azurerm"
  version = "5.2.0"

  resource_group_name     = azurerm_resource_group.resource_group.name
  use_for_each            = true
  resource_group_location = var.location
  subnet_names            = ["subnet-${var.environment}"]
  tags                    = local.common_tags
  vnet_name               = "vnet-${var.environment}"
}

