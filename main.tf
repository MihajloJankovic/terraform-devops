terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.70.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  skip_provider_registration = true
}




resource "azurerm_service_plan" "Plan" {
  name                = "example"
  resource_group_name = var.rg
  location            = var.location
  sku_name            = "B1"
  os_type             = "Windows"
}


resource "azurerm_windows_web_app" "App" {
  name                = "CleanPaySystem"
  resource_group_name = var.rg
  location            = var.location
  service_plan_id     = azurerm_service_plan.Plan.id

  site_config { 
   always_on = "false"
  }
  app_settings = {
    "dotnet_framework_version" = "v6.0"
  }
}
resource "azurerm_windows_web_app" "Api" {
  name                = "ApiCleanPaySystem"
  resource_group_name = var.rg
  location            = var.location
  service_plan_id     = azurerm_service_plan.Plan.id

    site_config {
      always_on = "false"
    }
  app_settings = {
    "WEBSITE_DNS_SERVER" = "168.63.129.16",
    "vnet_route_all_enabled" = "1"
  }
  public_network_access_enabled = false
}

resource "azurerm_app_service_virtual_network_swift_connection" "vnetintegrationconnection" {
  app_service_id  = azurerm_windows_web_app.App.id
  subnet_id       = azurerm_subnet.integrationsubnet.id
}





