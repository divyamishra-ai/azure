variable "name" {
  description = "Storage Account name (must be globally unique)"
  type        = string
}

variable "rg_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "account_tier" {
  description = "Storage account tier (Standard/Premium)"
  type        = string
}

variable "replication_type" {
  description = "Replication type (LRS, GRS, ZRS, etc.)"
  type        = string
}

# SECURITY
variable "public_access_enabled" {
  description = "Enable or disable public network access"
  type        = bool
}

# PRIVATE ENDPOINT
variable "private_subnet_id" {
  description = "Subnet ID for private endpoint"
  type        = string
}

variable "private_endpoint_name" {
  description = "Private endpoint name"
  type        = string
}

variable "private_service_connection_name" {
  description = "Private service connection name"
  type        = string
}

variable "subresource_names" {
  description = "Subresource names (blob/file/queue/table)"
  type        = list(string)
}

# DNS
variable "private_dns_zone_name" {
  description = "Private DNS zone name"
  type        = string
}

variable "dns_link_name" {
  description = "DNS VNet link name"
  type        = string
}

variable "dns_registration_enabled" {
  description = "Enable DNS auto-registration"
  type        = bool
}

# VNET
variable "vnet_id" {
  description = "Virtual Network ID"
  type        = string
}

# TAGS
variable "tags" {
  description = "Tags for storage account"
  type        = map(string)
}