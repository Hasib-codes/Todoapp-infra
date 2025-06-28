resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
}

# # Frontend Subnet
# data "azurerm_subnet" "frontend" {
#   name                 = "hasib-frontend-subnet"
#   virtual_network_name = "hasib-vnet"
#   resource_group_name  = "hasib-rg"
# }

# # Backend Subnet
# data "azurerm_subnet" "backend" {
#   name                 = "hasib-backend-subnet"
#   virtual_network_name = "hasib-vnet"
#   resource_group_name  = "hasib-rg"

# }          YE approach kar sakte ho par alg alg data block alg alg subnet ki ID laneke
            #  mujhe pasand nahi aaraaaa
            #  TO ab mai isme variable use krenge taki 
            #  Use karte vakht hum 2 subnet ka naam define kar paye 
            #  Niche Modular code dekho 




