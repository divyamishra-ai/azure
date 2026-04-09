resource "azurerm_mssql_server" "sql" {
  name                         = var.server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = var.sql_version
  administrator_login          = var.admin_user
  administrator_login_password = var.admin_password

  # PRIVATE ONLY
  public_network_access_enabled = var.public_access_enabled

  tags = var.tags
}

resource "azurerm_mssql_database" "db" {
  name      = var.db_name
  server_id = azurerm_mssql_server.sql.id
  sku_name  = var.db_sku

  tags = var.tags
}

# PRIVATE ENDPOINT
resource "azurerm_private_endpoint" "sql_pe" {
  name                = var.private_endpoint_name
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.private_subnet_id

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = azurerm_mssql_server.sql.id
    subresource_names              = var.subresource_names
    is_manual_connection           = false
  }

  tags = var.tags

  depends_on = [
    azurerm_mssql_server.sql
  ]
}

# PRIVATE DNS ZONE
resource "azurerm_private_dns_zone" "sql_dns" {
  name                = var.private_dns_zone_name
  resource_group_name = var.rg_name

  tags = var.tags
}

# DNS ↔ VNET LINK
resource "azurerm_private_dns_zone_virtual_network_link" "sql_dns_link" {
  name                  = var.dns_link_name
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.sql_dns.name
  virtual_network_id    = var.vnet_id

  depends_on = [
    azurerm_private_dns_zone.sql_dns
  ]
}