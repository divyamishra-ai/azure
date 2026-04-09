output "web_subnet_id" {
  description = "ID of the web subnet used for App Service VNet integration"
  value       = azurerm_subnet.web.id
}

output "container_subnet_id" {
  description = "ID of the subnet used for Container Apps environment"
  value       = azurerm_subnet.container.id
}

output "private_subnet_id" {
  description = "ID of the subnet used for private endpoints (SQL, Key Vault, Storage)"
  value       = azurerm_subnet.private.id
}

output "vnet_id" {
  description = "ID of the Virtual Network (used for private DNS linking)"
  value       = azurerm_virtual_network.vnet.id
}