

terraform {
  required_version = "~> 0.13.4"
  required_providers {
    azurerm = "~> 2.5.0"
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "fgr-solutions"
    workspaces {
      name = "fgr_azure_app_service"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}
}

# Common module
module "common" {
  resource_group_name    = var.resource_group_name
  location               = var.location
  environment            = var.environment

  source = "./modules/common"
}


# AKS module
module "aks" {
  location    = var.location
  environment = var.environment

  # Output module common
  resource_group_name = module.common.resource_group_name

  client_id       = var.client_id
  client_secret   = var.client_secret

  source     = "./modules/aks"
  depends_on = [module.common]
}

