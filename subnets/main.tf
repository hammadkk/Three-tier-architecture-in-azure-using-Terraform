# Create subnets
resource "azurerm_subnet" "Hammad_subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.${count.index + 1}.0/24"]
  depends_on           = [ var.vnet_id ]
}

# Output subnet ids
output "subnet_ids" {
  value = azurerm_subnet.Hammad_subnets[*].id
}