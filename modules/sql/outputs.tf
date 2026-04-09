output "sql_server_fqdn" {
  description = "Fully Qualified Domain Name of SQL Server"
  value       = azurerm_mssql_server.sql.fully_qualified_domain_name
}

output "database_name" {
  description = "SQL Database name"
  value       = azurerm_mssql_database.db.name
}

output "sql_server_id" {
  description = "SQL Server resource ID"
  value       = azurerm_mssql_server.sql.id
}

output "private_endpoint_id" {
  description = "Private Endpoint ID for SQL Server"
  value       = azurerm_private_endpoint.sql_pe.id
}