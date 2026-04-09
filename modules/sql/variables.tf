variable "server_name" {
  description = "Azure SQL Server name"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "admin_user" {
  description = "SQL admin username"
  type        = string
}

variable "admin_password" {
  description = "SQL admin password"
  type        = string
  sensitive   = true
}

variable "rg_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "sql_version" {
  description = "SQL Server version"
  type        = string
}

variable "db_sku" {
  description = "Database SKU"
  type        = string
}

# TAGS
variable "tags" {
  description = "Tags for SQL resources"
  type        = map(string)
}

# PRIVATE NETWORKING

variable "private_subnet_id" {
  description = "Subnet ID for SQL private endpoint"
  type        = string
}

variable "vnet_id" {
  description = "VNet ID for DNS link"
  type        = string
}

variable "public_access_enabled" {
  description = "Enable/Disable public network access"
  type        = bool
  default     = false
}

# PRIVATE ENDPOINT CONFIG

variable "private_endpoint_name" {
  description = "Private endpoint name"
  type        = string
}

variable "private_service_connection_name" {
  description = "Private service connection name"
  type        = string
}

variable "subresource_names" {
  description = "Subresources for private endpoint"
  type        = list(string)
  default     = ["sqlServer"]
}

# DNS CONFIG

variable "private_dns_zone_name" {
  description = "Private DNS zone name"
  type        = string
  default     = "privatelink.database.windows.net"
}

variable "dns_link_name" {
  description = "DNS VNet link name"
  type        = string
}