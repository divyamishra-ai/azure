resource "azurerm_container_app_environment" "env" {
  name                = var.env_name
  location            = var.location
  resource_group_name = var.rg_name

  infrastructure_subnet_id   = var.subnet_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  tags = var.tags
}

resource "azurerm_container_app" "app" {
  name                         = var.app_name
  container_app_environment_id = azurerm_container_app_environment.env.id
  resource_group_name          = var.rg_name
  revision_mode                = var.revision_mode

  template {
    container {
      name   = var.container_name
      image  = var.container_image

      cpu    = var.cpu
      memory = var.memory

      dynamic "env" {
        for_each = var.environment_variables
        content {
          name  = env.value.name
          value = env.value.value
        }
      }
    }
  }

  ingress {
    external_enabled = var.external_enabled
    target_port      = var.target_port

    traffic_weight {
      percentage      = var.traffic_percentage
      latest_revision = true
    }
  }

  tags = var.tags

  depends_on = [
    azurerm_container_app_environment.env
  ]
}