variable "subscription_id" {
  description = "d115ca25-a8e8-4afd-960b-135f53fcd450"
  type        = string
}

variable "tenant_id" {
  description = "d1bd4750-0901-4d48-a8a0-bf61cbbd3a99"
  type        = string
}

variable "client_id" {
  description = "c7b7fe63-197b-488f-b59c-bc8c9e819811"
  type        = string
}

variable "resource_group_name" {
  description = "DevopsPOC"
  type        = string
}

variable "location" {
  description = "East US"
  type        = string
}

variable "databricks_workspace_name" {
  description = "POC-databricks-workspace"
  type        = string
}

variable "sku" {
  description = "standard"
  type        = string
}

variable "app_service_plan_name" {
  description = "POC-appservice-plan"
  type        = string
}

variable "app_service_plan_tier" {
  description = "Basic"
  type        = string
}

variable "app_service_plan_size" {
  description = "B1"
  type        = string
}

variable "web_app_name" {
  description = "POC-webapp-demo"
  type        = string
}

variable "data_factory_name" {
  description = "Poc-azure-datafactory"
  default     = "pocazuredatafactory"
  type        = string
}

variable "vm_name" {
  description = "devopspoc"
  default     = "azdevopspoc"
}

variable "vm_size" {
  description = "Standard_DS2_v2"
  type        = string
}

variable "admin_username" {
  description = "linuxadmin"
  type        = string
}

variable "admin_password" {
  description = "123456789sS#"
  type        = string
}

variable "azurerm_network_interface" {
  description = "poc-devops-interfacenetwork"
  type        = string
}

variable "azurerm_virtual_network" {
  description = "poc-devops-virtualnetwork"
  type        = string
}

variable "azurerm_subnet" {
  description = "poc-devops-vmsubnet"
  type        = string
}

variable "azurerm_storage_account" {
  description = "pocdatalakestore"
  type        = string
}

variable "account_kind" {
  description = "StorageV2"
  type        = string
}
