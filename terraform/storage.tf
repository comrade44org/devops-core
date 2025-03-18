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

resource "azurerm_storage_container" "tfstate-azure-viz" {
  name = "azure-viz"
  storage_account_id = azurerm_storage_account.stgterraformastate44.id
}

resource "azurerm_role_assignment" "azure-viz-account-role" {
  scope = azurerm_storage_account.stgterraformastate44.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id = "096146b1-756f-40d2-890d-586d73f15c25"
}

resource "azurerm_role_assignment" "azure-viz-container-role" {
  scope = azurerm_storage_container.tfstate-azure-viz.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id = "096146b1-756f-40d2-890d-586d73f15c25"
}