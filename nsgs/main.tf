resource "azurerm_network_security_group" "Hammad_subnets_nsg" {
  count               = 3
  name                = "${var.subnet_names[count.index]}-nsg"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  depends_on          = [ var.subnet_ids ]

  # Default rules for all subnets
  dynamic "security_rule" {
    for_each = var.default_nsg_rules
    content {
      name                       = security_rule.value.name
      description                = security_rule.value.description
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  # Custom rules for specific subnets
  dynamic "security_rule" {
    for_each = var.custom_nsg_rules[count.index]
    content {
      name                       = security_rule.value.name
      description                = security_rule.value.description
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "Hammad_subnets_nsg_association" {
  count                     = 3
  subnet_id                 = var.subnet_ids[count.index]
  network_security_group_id = azurerm_network_security_group.Hammad_subnets_nsg[count.index].id
}