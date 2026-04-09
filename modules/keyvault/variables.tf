variable "kv_name" {
  description = "Key Vault name"
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

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "object_id" {
  description = "Azure AD Object ID for access policy"
  type        = string
}

variable "sku_name" {
  description = "Key Vault SKU (standard/premium)"
  type        = string

  validation {
    condition     = contains(["standard", "premium"], lower(var.sku_name))
    error_message = "SKU must be either 'standard' or 'premium'."
  }
}

variable "soft_delete_days" {
  description = "Soft delete retention days"
  type        = number

  validation {
    condition     = var.soft_delete_days >= 7 && var.soft_delete_days <= 90
    error_message = "Soft delete days must be between 7 and 90."
  }
}

variable "purge_protection_enabled" {
  description = "Enable purge protection"
  type        = bool
}

variable "secret_name" {
  description = "Secret name in Key Vault"
  type        = string
}

variable "sql_password" {
  description = "SQL password"
  type        = string
  sensitive   = true
}

variable "private_subnet_id" {
  description = "Subnet ID where private endpoint will be created"
  type        = string
}

variable "vnet_id" {
  description = "Virtual Network ID for private DNS link"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default     = {}
}

variable "public_network_access_enabled" {
  description = "Enable or disable public access"
  type        = bool
  default     = false
}