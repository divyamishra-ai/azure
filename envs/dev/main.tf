data "azurerm_client_config" "current" {}

module "rg" {
  source   = "../../modules/resource_group"
  name     = var.rg_name
  location = var.location
}

module "network" {
  source = "../../modules/network"

  vnet_name = var.vnet_name
  rg_name   = module.rg.name
  location  = module.rg.location

  address_space           = var.vnet_address_space
  web_subnet_prefix       = var.web_subnet_prefix
  container_subnet_prefix = var.container_subnet_prefix
  private_subnet_prefix   = var.private_subnet_prefix

  web_subnet_name        = var.web_subnet_name
  web_delegation_name    = var.web_delegation_name
  web_delegation_service = var.web_delegation_service

  container_subnet_name        = var.container_subnet_name
  container_delegation_name    = var.container_delegation_name
  container_delegation_service = var.container_delegation_service
  private_subnet_name          = var.private_subnet_name

  tags = var.tags
}

module "keyvault" {
  source = "../../modules/keyvault"

  kv_name   = var.kv_name
  rg_name   = module.rg.name
  location  = module.rg.location
  tenant_id = data.azurerm_client_config.current.tenant_id

  object_id = data.azurerm_client_config.current.object_id

  sku_name                 = var.kv_sku_name
  soft_delete_days         = var.kv_soft_delete_days
  purge_protection_enabled = var.kv_purge_protection_enabled

  secret_name  = var.kv_secret_name
  sql_password = var.sql_admin_password

  private_subnet_id = module.network.private_subnet_id
  vnet_id           = module.network.vnet_id

  public_network_access_enabled = var.kv_public_access_enabled

  tags = var.tags
}

module "sql" {
  source = "../../modules/sql"

  server_name    = var.sql_server_name
  db_name        = var.db_name
  admin_user     = var.sql_admin_user
  admin_password = var.sql_admin_password

  rg_name  = module.rg.name
  location = module.rg.location

  sql_version = var.sql_version
  db_sku      = var.db_sku

  # PRIVATE NETWORKING
  private_subnet_id = module.network.private_subnet_id
  vnet_id           = module.network.vnet_id

  # PRIVATE ENDPOINT CONFIG
  private_endpoint_name           = var.private_endpoint_name
  private_service_connection_name = var.private_service_connection_name
  subresource_names               = ["sqlServer"]

  # DNS
  dns_link_name       = var.dns_link_name

  # SECURITY
  public_access_enabled = var.sql_public_access_enabled

  tags = var.tags
}

module "storage" {
  source = "../../modules/storage"

  name     = var.storage_name
  rg_name  = module.rg.name
  location = module.rg.location

  account_tier     = var.account_tier
  replication_type = var.replication_type

  # SECURITY
  public_access_enabled = false

  # PRIVATE ENDPOINT
  private_subnet_id = module.network.private_subnet_id
  vnet_id           = module.network.vnet_id

  private_endpoint_name           = var.storage_private_endpoint_name
  private_service_connection_name = var.storage_private_service_connection_name

  subresource_names = ["blob"]

  # DNS
  private_dns_zone_name = var.storage_private_dns_zone_name
  dns_link_name         = var.storage_dns_link_name
  dns_registration_enabled = false

  tags = var.tags
}

module "container" {
  source   = "../../modules/container_app"
  env_name = var.container_env_name
  app_name = var.container_app_name
  rg_name  = module.rg.name
  location = module.rg.location

  container_name  = var.container_name
  container_image = var.container_image
  cpu             = var.cpu
  memory          = var.memory

  subnet_id          = module.network.container_subnet_id
  target_port        = var.target_port
  external_enabled   = var.external_enabled
  traffic_percentage = var.traffic_percentage
  revision_mode      = var.revision_mode

  log_analytics_workspace_id = var.log_analytics_workspace_id

  db_host      = module.sql.sql_server_fqdn
  storage_name = module.storage.storage_name
  latest_revision       = true
  tags = var.tags
}

module "web" {
  source = "../../modules/webapp"

  plan_name = var.app_service_plan_name
  app_name  = var.webapp_name

  rg_name  = module.rg.name
  location = module.rg.location

  os_type      = var.os_type
  sku_name     = var.sku_name
  docker_image = var.docker_image

  # VNET INTEGRATION
  subnet_id = module.network.web_subnet_id

  # PRIVATE CONTROL
  public_access_enabled = var.web_public_access_enabled
  always_on             = var.always_on

  # NEW (REQUIRED)
  https_only          = var.https_only
  docker_registry_url = var.docker_registry_url
  websites_port       = var.websites_port

  # APP INTEGRATION
  db_host       = module.sql.sql_server_fqdn
  db_name       = module.sql.database_name
  storage_name  = module.storage.storage_name
  container_url = module.container.container_app_url

  tags = var.tags
}
