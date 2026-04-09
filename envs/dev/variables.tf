variable "rg_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "kv_name" {
  description = "Key Vault name"
  type        = string
}

variable "sql_server_name" {
  description = "SQL Server name"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "sql_admin_user" {
  description = "SQL admin username"
  type        = string
}

variable "sql_admin_password" {
  description = "SQL admin password"
  type        = string
  sensitive   = true
}

variable "storage_name" {
  description = "Storage account name"
  type        = string
}

variable "container_env_name" {
  description = "Container App environment name"
  type        = string
}

variable "container_app_name" {
  description = "Container App name"
  type        = string
}

variable "webapp_name" {
  description = "Web App name"
  type        = string
}

variable "app_service_plan_name" {
  description = "App Service plan name"
  type        = string
}

variable "container_name" {
  description = "Container name"
  type        = string
}

variable "container_image" {
  description = "Container image"
  type        = string
}

variable "cpu" {
  description = "CPU allocation"
  type        = number
}

variable "memory" {
  description = "Memory allocation"
  type        = string
}

variable "target_port" {
  description = "Container port"
  type        = number
}

variable "external_enabled" {
  description = "Enable external ingress"
  type        = bool
}

variable "traffic_percentage" {
  description = "Traffic percentage to latest revision"
  type        = number
}

variable "revision_mode" {
  description = "Container revision mode"
  type        = string
}

# 🔹 KEYVAULT
variable "kv_sku_name" {
  type = string
}

variable "kv_soft_delete_days" {
  type = number
}

variable "kv_purge_protection_enabled" {
  type = bool
}

variable "kv_secret_name" {
  type = string
}

variable "kv_public_access_enabled" {
  description = "Enable/Disable Key Vault public access"
  type        = bool
}

# 🔹 SQL
variable "sql_version" {
  type = string
}

variable "db_sku" {
  type = string
}

variable "sql_public_access_enabled" {
  description = "Enable/Disable SQL public access"
  type        = bool
}

variable "private_endpoint_name" {
  type = string
}

variable "private_service_connection_name" {
  type = string
}

variable "dns_link_name" {
  type = string
}

variable "dns_zone_group_name" {
  type = string
}

variable "dns_config_name" {
  type = string
}

# 🔹 STORAGE PRIVATE CONFIG

variable "account_tier" {
  type = string
}

variable "replication_type" {
  type = string
}

variable "storage_private_endpoint_name" {
  description = "Storage Private Endpoint name"
  type        = string
}

variable "storage_private_service_connection_name" {
  description = "Storage private service connection name"
  type        = string
}

variable "storage_private_dns_zone_name" {
  description = "Storage private DNS zone name"
  type        = string
}

variable "storage_dns_link_name" {
  description = "Storage DNS VNet link name"
  type        = string
}

variable "storage_dns_zone_group_name" {
  description = "Storage DNS zone group name"
  type        = string
}

variable "storage_dns_config_name" {
  description = "Storage DNS config name"
  type        = string
}

# 🔹 WEB
variable "os_type" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "docker_image" {
  type = string
}

variable "web_public_access_enabled" {
  type = bool
}

variable "always_on" {
  type = bool
}

variable "https_only" {
  description = "Enable HTTPS only"
  type        = bool
}

variable "docker_registry_url" {
  description = "Docker registry URL"
  type        = string
}

variable "websites_port" {
  description = "Application port"
  type        = string
}

# 🔹 NETWORK
variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "web_subnet_prefix" {
  type = list(string)
}

variable "container_subnet_prefix" {
  type = list(string)
}

variable "private_subnet_prefix" {
  type = list(string)
}

variable "web_subnet_name" {
  type = string
}

variable "web_delegation_name" {
  type = string
}

variable "web_delegation_service" {
  type = string
}

variable "container_subnet_name" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "container_delegation_name" {
  type = string
}

variable "container_delegation_service" {
  type = string
}

# 🔹 COMMON TAGS
variable "tags" {
  description = "Common tags"
  type        = map(string)
}

