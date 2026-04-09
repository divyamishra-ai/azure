output "storage_name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.storage.name
}

output "primary_blob_endpoint" {
  description = "Primary Blob endpoint"
  value       = azurerm_storage_account.storage.primary_blob_endpoint
}

output "storage_account_id" {
  description = "Storage Account resource ID"
  value       = azurerm_storage_account.storage.id
}

output "private_endpoint_id" {
  description = "Private Endpoint ID for Storage"
  value       = azurerm_private_endpoint.storage_pe.id
}

output "primary_connection_string" {
  description = "Primary connection string for Storage Account"
  value       = azurerm_storage_account.storage.primary_connection_string
  sensitive   = true
}