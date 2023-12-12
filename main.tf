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

module "subnets" {
  source = "./subnets"
  resource_group_location = var.resource_group_location
  resource_group_name = var.resource_group_name
  vnet_name = var.vnet_name
  subnet_names = var.subnet_names
  vnet_id = module.network.vnet_id
}

module "nsgs" {
  source = "./nsgs"
  resource_group_location = var.resource_group_location
  resource_group_name = var.resource_group_name
  vnet_name = var.vnet_name
  subnet_names = var.subnet_names
  default_nsg_rules = var.default_nsg_rules
  custom_nsg_rules = var.custom_nsg_rules
  subnet_ids = module.subnets.subnet_ids
  vnet_id = module.network.vnet_id
}