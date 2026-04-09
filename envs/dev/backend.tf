terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "tfstate98765abc"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}