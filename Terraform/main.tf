provider "azurerm" {
  features {}
  subscription_id = "d9dd746d-de77-4a69-9338-b05287e38399"
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Azure Container Registry (ACR)
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# App Service Plan (Linux)
resource "azurerm_app_service_plan" "appsp" {
  name                = "capstone-app-serviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

# Web App (Docker Container)
resource "azurerm_app_service" "webapp" {
  name                = "capstoneautoscaleapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appsp.id

  site_config {
    linux_fx_version = "DOCKER|${azurerm_container_registry.acr.login_server}/capstoneapp:v1"
    always_on        = true
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"      = "https://${azurerm_container_registry.acr.login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.acr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.acr.admin_password
  }
}
