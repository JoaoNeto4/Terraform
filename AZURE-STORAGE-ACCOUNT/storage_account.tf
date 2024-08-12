resource "azurerm_resource_group" "exemple_resource_group" {
  name     = var.resource_group_name
  location = var.locations

  tags = local.common_tags
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.exemple_resource_group.name
  location                 = var.locations
  account_tier             = var.account_tier
  account_replication_type = var.account_application_type

  tags = local.common_tags
}

resource "azurerm_storage_container" "container" {
  name                 = var.container_name
  storage_account_name = azurerm_storage_account.storage_account.name
}

