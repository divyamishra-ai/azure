resource "azurerm_storage_account" "storage" {
  name                     = var.name
  resource_group_name      = var.rg_name
  location                 = var.location

  account_tier             = var.account_tier
  account_replication_type = var.replication_type

  # SECURITY (PRIVATE ONLY)
  public_network_access_enabled = var.public_access_enabled

  tags = var.tags
}

# PRIVATE ENDPOINT
resource "azurerm_private_endpoint" "storage_pe" {
  name                = var.private_endpoint_name
  location            = var.location
  resource_group_name = var.rg_name
  subnet_id           = var.private_subnet_id

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = azurerm_storage_account.storage.id
    subresource_names              = var.subresource_names
    is_manual_connection           = false
  }

  tags = var.tags

  depends_on = [
    azurerm_storage_account.storage
  ]
}

# PRIVATE DNS ZONE
resource "azurerm_private_dns_zone" "storage_dns" {
  name                = var.private_dns_zone_name
  resource_group_name = var.rg_name

  tags = var.tags
}

# DNS ↔ VNET LINK
resource "azurerm_private_dns_zone_virtual_network_link" "storage_dns_link" {
  name                  = var.dns_link_name
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.storage_dns.name
  virtual_network_id    = var.vnet_id

  registration_enabled = var.dns_registration_enabled

  depends_on = [
    azurerm_private_dns_zone.storage_dns
  ]
}