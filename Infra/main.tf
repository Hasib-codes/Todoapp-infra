module "resource_group" {
  source      = "../Modules/resourcegroup"
  rg_name     = "hasib-rg"
  rg_location = "canada central"
}

module "virtual_network" {
  source        = "../Modules/vnet"
  depends_on    = [module.resource_group]
  vnet_name     = "hasib-vnet"
  vnet_location = "canada central"
  rg_name       = "hasib-rg"
  address_space = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  source           = "../Modules/subnet"
  depends_on       = [module.virtual_network]
  subnet_name      = "hasib-frontend-subnet"
  rg_name          = "hasib-rg"
  vnet_name        = "hasib-vnet"
  address_prefixes = ["10.0.1.0/24"]
}

module "frontend_vm" {
  source      = "../Modules/vm"
  depends_on  = [module.frontend_subnet]
  vm_name     = "hasib-frontend-vm"
  vm_location = "canada central"
  username    = "hasibadmin"
  password    = "Password@1"

  vnet_name   = "hasib-vnet"
  subnet_name = "hasib-frontend-subnet"
 

  rg_name      = "hasib-rg"
  nic_name     = "hasib-frontend-nic"
  nic_location = "canada central"

  image_publisher = "canonical"
  image_offer     = "0001-com-ubuntu-server-jammy"
  sku             = "22_04-lts"
}

module "frontend-pip" {
  source     = "../Modules/public-ip"
  depends_on = [module.resource_group, module.frontend_vm]
  pip_name   = "hasib-frontend-pip"
  rg_name    = "hasib-rg"
  location   = "canada central"
}

module "backend_subnet" {
  source           = "../Modules/subnet"
  depends_on       = [module.virtual_network]
  subnet_name      = "hasib-backend-subnet"
  rg_name          = "hasib-rg"
  vnet_name        = "hasib-vnet"
  address_prefixes = ["10.0.2.0/24"]
}

module "backend_vm" {
  source      = "../Modules/vm"
  depends_on  = [module.backend_subnet]
  vm_name     = "hasib-backend-vm"
  vm_location = "canada central"
  username    = "hasibadmin"
  password    = "Password@1"

  vnet_name   = "hasib-vnet"
  subnet_name = "hasib-backend-subnet"

  rg_name      = "hasib-rg"
  nic_name     = "hasib-backend-nic"
  nic_location = "canada central"

  image_publisher = "canonical"
  image_offer     = "0001-com-ubuntu-server-focal"
  sku             = "20_04-lts"
}


module "backend-pip" {
  source     = "../Modules/public-ip"
  depends_on = [module.resource_group, module.backend_vm]
  pip_name   = "hasib-backend-pip"
  rg_name    = "hasib-rg"
  location   = "canada central"
}
