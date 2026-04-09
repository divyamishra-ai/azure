resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space

  tags = var.tags
}

# 🔹 Web Subnet (App Service)
resource "azurerm_subnet" "web" {
  name                 = var.web_subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.web_subnet_prefix

  delegation {
    name = var.web_delegation_name

    service_delegation {
      name = var.web_delegation_service
    }
  }
}

# 🔹 Container Subnet (Fully Variable Driven)
resource "azurerm_subnet" "container" {
  name                 = var.container_subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.container_subnet_prefix

  delegation {
    name = var.container_delegation_name

    service_delegation {
      name = var.container_delegation_service
    }
  }
}

# 🔹 Private Subnet (SQL, KV, Storage)
resource "azurerm_subnet" "private" {
  name                 = var.private_subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.private_subnet_prefix
}