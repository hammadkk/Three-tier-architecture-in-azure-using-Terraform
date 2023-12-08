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

variable "vnet_id" {
  type        = string
}