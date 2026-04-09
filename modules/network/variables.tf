variable "vnet_name" {
  description = "VNet name"
  type        = string
}

variable "rg_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "address_space" {
  description = "VNet CIDR"
  type        = list(string)
}

# 🔹 Web subnet
variable "web_subnet_name" {
  type    = string
  default = "web-subnet"
}

variable "web_subnet_prefix" {
  type = list(string)
}

variable "web_delegation_name" {
  type    = string
  default = "web-delegation"
}

variable "web_delegation_service" {
  type    = string
  default = "Microsoft.Web/serverFarms"
}

# 🔹 Container subnet
variable "container_subnet_name" {
  type    = string
  default = "container-subnet"
}

variable "container_subnet_prefix" {
  type = list(string)
}

# 🔹 Private subnet
variable "private_subnet_name" {
  type    = string
  default = "private-endpoint-subnet"
}

variable "private_subnet_prefix" {
  type = list(string)
}

variable "container_delegation_name" {
  description = "Delegation name for container subnet"
  type        = string
}

variable "container_delegation_service" {
  description = "Delegation service for container subnet"
  type        = string
}
# 🔹 Tags
variable "tags" {
  type = map(string)
}