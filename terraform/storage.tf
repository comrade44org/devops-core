resource "azurerm_resource_group" "rg-devops-01" {
  name     = "rg-devops-01"
  location = "uksouth"
}

resource "azurerm_storage_account" "stgterraformastate44" {
  name = "stgterraformstate44"
  resource_group_name = azurerm_resource_group.rg-devops-01.name
  location = "uksouth"
  account_tier = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate-iac-k8s-cluster" {
  name = "tfstate-iac-k8s-cluster"
  storage_account_name = azurerm_storage_account.stgterraformastate44.name
}
