resource "azurerm_key_vault" "kv" {
  name                = var.kv_name
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = var.tenant_id
  sku_name            = var.sku_name

  soft_delete_retention_days = var.soft_delete_days
  purge_protection_enabled   = var.purge_protection_enabled

  # PRIVATE ACCESS ONLY
  public_network_access_enabled = var.public_network_access_enabled

  # Access Policy
  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    secret_permissions = [
      "Get",
      "Set",
      "List"
    ]
  }

  tags = var.tags
}

# Store Secret (SQL Password)
resource "azurerm_key_vault_secret" "sql_password" {
  name         = var.secret_name
  value        = var.sql_password
  key_vault_id = azurerm_key_vault.kv.id
}

# Private Endpoint
resource "azurerm_private_endpoint" "kv_pe" {
  name                = "${var.kv_name}-pe"
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.private_subnet_id

  private_service_connection {
    name                           = "${var.kv_name}-connection"
    private_connection_resource_id = azurerm_key_vault.kv.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  tags = var.tags
}

# Private DNS Zone
resource "azurerm_private_dns_zone" "kv_dns" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = var.rg_name

  tags = var.tags
}

# DNS ↔ VNet Link
resource "azurerm_private_dns_zone_virtual_network_link" "kv_dns_link" {
  name                  = "${var.kv_name}-dns-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.kv_dns.name
  virtual_network_id    = var.vnet_id

  tags = var.tags
}