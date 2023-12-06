provider "azurerm" {
  features {}
  subscription_id = "Enter your subscription id here"
  skip_provider_registration = true
}

data "azurerm_resource_group" "existing" {
  name = "Enter resource group name"
}

module "network" {
  source = "./network"
  resource_group_location = var.resource_group_location
  resource_group_name = var.resource_group_name
  vnet_name = var.vnet_name
}
