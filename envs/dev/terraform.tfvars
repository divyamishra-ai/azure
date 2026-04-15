# 🔹 Resource Group
rg_name  = "rg-dev"
location = "Central India"

# 🔹 Key Vault
kv_name                     = "kvdev12345x"
kv_sku_name                 = "standard"
kv_soft_delete_days         = 7
kv_purge_protection_enabled = false
kv_secret_name              = "sql-password"
kv_public_access_enabled    = true

# 🔹 SQL
sql_server_name    = "sqldev12345x"
db_name            = "devdb"
sql_admin_user     = "sqladmin"
sql_admin_password = "Password@1234"

sql_version = "12.0"
db_sku      = "S0"

# 🔒 SQL PRIVATE
sql_public_access_enabled = false

private_endpoint_name           = "sql-pe-dev"
private_service_connection_name = "sql-connection"

dns_link_name       = "sql-dns-link"
dns_zone_group_name = "sql-dns-group"
dns_config_name     = "sql-config"

# 🔹 Storage
storage_name                            = "storagedev12345x"
account_tier                            = "Standard"
replication_type                        = "LRS"
storage_private_endpoint_name           = "storage-pe-dev"
storage_private_service_connection_name = "storage-connection"

storage_private_dns_zone_name = "privatelink.blob.core.windows.net"

storage_dns_link_name       = "storage-dns-link"
storage_dns_zone_group_name = "storage-dns-group"
storage_dns_config_name     = "storage-config"

# 🔹 Container App (PRIVATE)
container_env_name = "container-env-dev"
container_app_name = "container-dev"

container_name  = "app"
container_image = "nginx"
cpu             = 0.5
memory          = "1Gi"

target_port                = 80
external_enabled           = false
traffic_percentage         = 100
revision_mode              = "Single"
log_analytics_workspace_id = "/subscriptions/995cdbcf-788d-40cf-a960-771a09baf940/resourceGroups/rg-dev/providers/Microsoft.OperationalInsights/workspaces/law-dev"

# 🔹 Web App (PRIVATE)
webapp_name           = "webapp-dev12345x"
app_service_plan_name = "plan-dev"

os_type      = "Linux"
sku_name     = "B1"
docker_image = "nginx"

web_public_access_enabled = true
always_on                 = true

# 🔹 Web App EXTRA (REQUIRED)
https_only          = true
docker_registry_url = "https://index.docker.io"
websites_port       = "80"

# 🔹 Network
vnet_name = "vnet-dev"

vnet_address_space      = ["10.0.0.0/16"]
web_subnet_prefix       = ["10.0.1.0/24"]
container_subnet_prefix = ["10.0.2.0/24"]
private_subnet_prefix   = ["10.0.3.0/24"]

web_subnet_name        = "web-subnet"
web_delegation_name    = "web-delegation"
web_delegation_service = "Microsoft.Web/serverFarms"

container_subnet_name = "container-subnet"
private_subnet_name   = "private-endpoint-subnet"

container_delegation_name    = "container-delegation"
container_delegation_service = "Microsoft.App/environments"

# 🔹 Common Tags
tags = {
  environment = "dev"
  project     = "terraform-demo"
}