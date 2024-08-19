resource "azurerm_resource_group" "rg-devops-01" {
  name     = "rg-devops-01"
  location = "uksouth"
}

resource "azurerm_storage_account" "stgterraformastate44" {
  name = "stgterraformstate44"
  resource_group_name = azurerm_resource_group.rg-devops-01
  location = "uksouth"
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "stg-tfstate-01" {
  name = "stg-tfstate-01"
  storage_account_name = azurerm_storage_account.stgterraformastate44.name
}
