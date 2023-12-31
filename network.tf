# resource "azurerm_private_dns_zone" "dnsprivatezone" {
#   name                = "CleanPaySystem.azurewebsites.net"
#   resource_group_name = var.rg
# }
# resource "azurerm_virtual_network" "vnet" {
#   name                = "vnet"
#   location            = var.location
#   resource_group_name = var.rg
#   address_space       = ["10.0.0.0/16"]
# }
# resource "azurerm_subnet" "integrationsubnet" {

#   name                 = "integrationsubnet"
#   resource_group_name = var.rg
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.1.0/24"]
#   delegation {
#     name = "delegation"
#     service_delegation {
#       name = "Microsoft.Web/serverFarms"
#     }
#   }
# }
# resource "azurerm_subnet" "endpointsubnet" {
#   name                 = "endpointsubnet"
#   resource_group_name = var.rg
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.2.0/24"]
#   private_endpoint_network_policies_enabled = true
# }