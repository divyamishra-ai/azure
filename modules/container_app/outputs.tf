output "container_app_name" {
  description = "Container App name"
  value       = azurerm_container_app.app.name
}

output "container_app_id" {
  description = "Container App resource ID"
  value       = azurerm_container_app.app.id
}

output "container_app_url" {
  description = "Container App FQDN (works only if external_enabled = true)"
  value       = azurerm_container_app.app.latest_revision_fqdn
}

output "container_env_id" {
  description = "Container App Environment ID"
  value       = azurerm_container_app_environment.env.id
}