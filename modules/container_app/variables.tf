variable "env_name" {
  description = "Container App Environment name"
  type        = string
}

variable "app_name" {
  description = "Container App name"
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

# 🔹 Container config
variable "container_name" {
  description = "Container name"
  type        = string
}

variable "container_image" {
  description = "Container image (e.g., nginx, custom image)"
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
  description = "Enable external access"
  type        = bool
}

variable "traffic_percentage" {
  description = "Traffic percentage to latest revision"
  type        = number
}

variable "revision_mode" {
  description = "Revision mode (Single or Multiple)"
  type        = string
}

# 🔹 App integrations
variable "db_host" {
  description = "SQL Server hostname"
  type        = string
}

variable "storage_name" {
  description = "Storage Account name"
  type        = string
}

# 🔹 Networking
variable "subnet_id" {
  description = "Subnet ID for Container App Environment"
  type        = string
}

variable "environment_variables" {
  description = "List of environment variables"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "latest_revision" {
  description = "Route traffic to latest revision"
  type        = bool
}

# 🔹 Optional (Production)
variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID"
  type        = string
}

# 🔹 Tags
variable "tags" {
  description = "Tags for Container resources"
  type        = map(string)
}

