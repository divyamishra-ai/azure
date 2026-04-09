variable "plan_name" {
  description = "App Service Plan name"
  type        = string
}

variable "app_name" {
  description = "Web App name"
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

variable "os_type" {
  description = "OS type (Linux/Windows)"
  type        = string
}

variable "sku_name" {
  description = "App Service SKU (B1, S1, P1V2, etc.)"
  type        = string
}

variable "docker_image" {
  description = "Docker image for Web App"
  type        = string
}

variable "docker_registry_url" {
  description = "Docker registry URL"
  type        = string
}

variable "https_only" {
  description = "Enable HTTPS only"
  type        = bool
}

variable "websites_port" {
  description = "Application port"
  type        = string
}

variable "db_host" {
  description = "SQL Server hostname"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "storage_name" {
  description = "Storage account name"
  type        = string
}

variable "container_url" {
  description = "Container App URL"
  type        = string
}

variable "tags" {
  description = "Tags for Web App"
  type        = map(string)
}

variable "subnet_id" {
  description = "Subnet ID for VNet integration"
  type        = string
}

variable "public_access_enabled" {
  description = "Enable or disable public access"
  type        = bool
}

variable "always_on" {
  description = "Enable Always On setting"
  type        = bool
}