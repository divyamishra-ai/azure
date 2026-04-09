resource "azurerm_service_plan" "plan" {
  name                = var.plan_name
  location            = var.location
  resource_group_name = var.rg_name

  os_type  = var.os_type
  sku_name = var.sku_name

  tags = var.tags
}

resource "azurerm_linux_web_app" "web" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.rg_name
  service_plan_id     = azurerm_service_plan.plan.id

  # VNET INTEGRATION (MANDATORY)
  virtual_network_subnet_id = var.subnet_id

  # PRIVATE ACCESS CONTROL
  public_network_access_enabled = var.public_access_enabled

  # SECURITY (optional but recommended)
  https_only = var.https_only

  site_config {
    always_on = var.always_on

    application_stack {
      docker_image_name   = var.docker_image
      docker_registry_url = var.docker_registry_url
    }
  }

  app_settings = {
    DB_HOST         = var.db_host
    DB_NAME         = var.db_name
    STORAGE_ACCOUNT = var.storage_name
    CONTAINER_API   = var.container_url

    # optional but useful
    WEBSITES_PORT = var.websites_port
  }

  tags = var.tags

  depends_on = [
    azurerm_service_plan.plan
  ]
}