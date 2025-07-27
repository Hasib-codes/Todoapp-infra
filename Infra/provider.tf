terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
  backend "azurerm" {
    resource_resource_group_name = "hasib-rg"           
    storage_account_name = "hasib-storage"                                 
    container_name       = "tfstate"                                  
    key                  = "prod.terraform.tfstate"                   
  }
}
provider "azurerm" {
  features {}
  subscription_id = "34efc0a7-8590-4931-b801-1a4f91725596"
}