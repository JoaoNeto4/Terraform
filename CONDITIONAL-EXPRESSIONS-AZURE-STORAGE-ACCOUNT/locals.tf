#https://developer.hashicorp.com/terraform/language/expressions/references
#https://developer.hashicorp.com/terraform/language/values/locals

locals {
  common_tags = {
    owner      = "joaoneto"
    managed-by = "terraform"
  }
}

