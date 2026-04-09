output "resource_group_name" {
  description = "Resource Group Name"
  value       = module.rg.name
}

# 🔹 WEB
output "web_app_url" {
  description = "Web App URL (public only if enabled)"
  value       = module.web.web_app_url
}

# 🔹 CONTAINER
output "container_app_internal_url" {
  description = "Container App FQDN (internal only, since external access is disabled)"
  value       = module.container.container_app_url
}

# 🔹 SQL
output "sql_server_fqdn" {
  description = "SQL Server FQDN (private endpoint enabled)"
  value       = module.sql.sql_server_fqdn
}

output "database_name" {
  description = "Database Name"
  value       = module.sql.database_name
}

# 🔹 STORAGE
output "storage_account_name" {
  description = "Storage Account Name"
  value       = module.storage.storage_name
}

output "storage_blob_endpoint" {
  description = "Storage Blob Endpoint (private access via VNet)"
  value       = module.storage.primary_blob_endpoint
}

# 🔹 KEY VAULT
output "key_vault_id" {
  description = "Key Vault ID"
  value       = module.keyvault.kv_id
}

output "key_vault_name" {
  description = "Key Vault Name"
  value       = module.keyvault.kv_name
}

output "key_vault_secret_id" {
  description = "Key Vault Secret ID"
  value       = module.keyvault.secret_id
  sensitive   = true
}

output "key_vault_private_endpoint_id" {
  description = "Key Vault Private Endpoint ID"
  value       = module.keyvault.private_endpoint_id
}