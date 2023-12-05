resource "azurerm_virtual_network" "Hammad-vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
}

output "vnet_id" {
  value = azurerm_virtual_network.Hammad-vnet.id
}