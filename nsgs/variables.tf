variable "resource_group_location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "vnet_name" {
  type        = string
}

variable "subnet_names" {
  type        = list(string)
}

variable "subnet_ids" {
  type        = list(string)
}

variable "vnet_id" {
  type        = string
}

variable "default_nsg_rules" {
  description = "Default rules for all subnets"
  type        = list(object({
    description                = string
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "custom_nsg_rules" {
  description = "Custom rules for all subnets"
  type        = list(list(object({
    description                = string
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })))
}