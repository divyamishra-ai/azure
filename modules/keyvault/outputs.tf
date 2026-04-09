output "kv_id" {
  description = "Key Vault ID"
  value       = azurerm_key_vault.kv.id
}

output "kv_name" {
  description = "Key Vault name"
  value       = azurerm_key_vault.kv.name
}

output "secret_id" {
  description = "Secret ID"
  value       = azurerm_key_vault_secret.sql_password.id
}

output "private_endpoint_id" {
  description = "Private Endpoint ID for Key Vault"
  value       = azurerm_private_endpoint.kv_pe.id
}