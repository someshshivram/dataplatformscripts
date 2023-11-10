provider "azurerm" {
  features = {}
}

resource "azurerm_resource_group" "example" {
  name     = "dataplatform-resource-group"
  location = "East US"
}

resource "azurerm_storage_account" "example" {
  name                     = "dataplatform_exampledatalakestorage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "dataplatform_example-container"
  storage_account_name  = dataplatform_azurerm_storage_account.example.name
  container_access_type = "private"
}

output "storage_account_key" {
  value = azurerm_storage_account.example.primary_access_key
}

output "storage_account_id" {
  value = azurerm_storage_account.example.id
}
