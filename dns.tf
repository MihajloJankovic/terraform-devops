# resource "azurerm_private_dns_zone_virtual_network_link" "dnszonelink" {
#   name = "dnszonelink"
#   resource_group_name =var.rg
#   private_dns_zone_name = azurerm_private_dns_zone.dnsprivatezone.name
#   virtual_network_id = azurerm_virtual_network.vnet.id
# }

# resource "azurerm_private_endpoint" "privateendpoint" {
#   name                = "backwebappprivateendpoint"
#   location            = var.location
#   resource_group_name = var.rg
#   subnet_id           = azurerm_subnet.endpointsubnet.id

#   private_dns_zone_group {
#     name = "privatednszonegroup"
#     private_dns_zone_ids = [azurerm_private_dns_zone.dnsprivatezone.id]
#   }

#   private_service_connection {
#     name = "privateendpointconnection"
#     private_connection_resource_id = azurerm_windows_web_app.Api.id
#     subresource_names = ["sites"]
#     is_manual_connection = false
#   }
# }