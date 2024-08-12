variable "locations" {
  #https://learn.microsoft.com/en-us/azure/reliability/availability-zones-service-support
  #https://developer.hashicorp.com/terraform/language/values/variables

  description = "Região de criação dos recusos na Azure"
  type        = string
  default     = "West Europe"
}

variable "account_tier" {
  description = "Tier da storage account na Azure"
  type        = string
  default     = "Standard"
}

variable "account_application_type" {
  description = "Tipo de replicação de dados da Storage Account"
  type        = string
  default     = "LRS"
}

variable "resource_group_name" {
  description = "Nome para o resource group da Azure"
  type        = string
  default     = "rg-course-terraform"
}

variable "storage_account_name" {
  description = "Nome da storage account na Azure"
  type        = string
  default     = "joaonetoterraform"
}

variable "container_name" {
  description = "Nome do container na Azure"
  type        = string
  default     = "container-terraform"
}