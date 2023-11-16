provider "azurerm" {
  features {}
  subscription_id   = var.subscription_id
  tenant_id         = var.tenant_id
  client_id         = client_id
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_databricks_workspace" "example" {
  name                = var.databricks_workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
}

resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = var.app_service_plan_tier
    size = var.app_service_plan_size
  }
}

resource "azurerm_app_service" "example" {
  name                = var.web_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    always_on = true
  }
}

# Create an Azure Data Factory
resource "azurerm_data_factory" "example" {
  name                = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}


# Create an Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "example" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.example.id]

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  custom_data = base64encode("apt-get update && apt-get install -y apache2")
}

# Create a network interface for the VM
resource "azurerm_network_interface" "example" {
  name                = var.azurerm_network_interface
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Define a virtual network and subnet for the VM
resource "azurerm_virtual_network" "example" {
  name                = var.azurerm_virtual_network
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = var.azurerm_subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_storage_account" "example" {
  name                     = var.azurerm_storage_account
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.sku
  account_replication_type = "LRS"
  account_kind             = var.account_kind
  is_hns_enabled           = "true"
}

