variable "resource_group_name" {
  type    = string
  default = "Enter your resource group here"
}

variable "resource_group_location" {
  type    = string
  default = "East US"
}

variable "vnet_name" {
  type    = string
  default = "Hammad-vnet"
}


variable "subnet_names" {
  type    = list(string)
  default = ["Hammad-subnet-1", "Hammad-subnet-2", "Hammad-subnet-3"]
}

variable "default_nsg_rules" {
  description = "Default rules for all subnets"
  type        = list(object({
    name                       = string
    description                = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = [
    {
      description                = "Deny all types of inbound traffic"
      name                       = "DenyAllInbound"
      priority                   = 4001
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      description                = "Deny all types of outbound traffic"
      name                       = "DenyAllOutbound"
      priority                   = 4002
      direction                  = "Outbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
  ]
}

variable "custom_nsg_rules" {
  description = "Custom rules for specific subnets"
  type        = list(list(object({
    name                       = string
    description                = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })))
  default = [
    [
      {
        description                = "Allow inbound HTTP traffic from the Internet"
        name                       = "AllowHTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "Internet"
        destination_address_prefix = "*"
      },
      {
        description                = "Allow inbound HTTPS traffic from the Internet"
        name                       = "AllowHTTPS"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "Internet"
        destination_address_prefix = "*"
      },
      {
        description                = "Allow outbound traffic to the backend subnet in the same virtual network"
        name                       = "AllowBackendOutboundCommunication"
        priority                   = 300
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "*"
        destination_address_prefix = "10.0.2.0/24"
      },
      {
        description                = "Allow outbound traffic to the public internet"
        name                       = "AllowInternetOutboundCommunication"
        priority                   = 400
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.0.1.0/24"
        destination_address_prefix = "Internet"
      }
    ],
    [
      {
        description                = "Allow inbound traffic from the frontend subnet in the same virtual network"
        name                       = "Allow8080Inbound"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "10.0.1.0/24"
        destination_address_prefix = "*"
      },
      {
        description                = "Allow outbound traffic to the frontend subnet in the same virtual network"
        name                       = "AllowCustomVnetFrontendOutbound"
        priority                   = 200
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "10.0.1.0/24"
      },
      {
        description                = "Allow outbound traffic to the db subnet in the same virtual network"
        name                       = "AllowCustomVnetDBOutbound"
        priority                   = 300
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "10.0.3.0/24"
      },
    ],
    [
      {
        description                = "Allow inbound traffic from the backend subnet in the same virtual network"
        name                       = "Allow5432Inbound"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5432"
        source_address_prefix      = "10.0.2.0/24"
        destination_address_prefix = "*"
      },
    ],
  ]
}