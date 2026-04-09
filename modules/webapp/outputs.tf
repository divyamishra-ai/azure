output "web_app_url" {
  description = "Web App URL (accessible only if public access is enabled)"
  value       = "https://${azurerm_linux_web_app.web.default_hostname}"
}

output "web_app_name" {
  description = "Web App name"
  value       = azurerm_linux_web_app.web.name
}

output "web_app_id" {
  description = "Web App resource ID"
  value       = azurerm_linux_web_app.web.id
}