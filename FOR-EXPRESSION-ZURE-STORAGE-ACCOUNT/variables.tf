variable "locations" {
  #https://learn.microsoft.com/en-us/azure/reliability/availability-zones-service-support
  #https://developer.hashicorp.com/terraform/language/values/variables
  #https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  #https://learn.microsoft.com/en-us/azure/reliability/availability-zones-service-support

  description = "Região onde os recursos serão criados na Azure"
  type        = map(string)
  default = {
    "europa" = "West Europe",
    "eua"    = "East Us",
    "asia"   = "Japan East",
    "brasil" = "Brazil South"
  }

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

