terraform {
  required_version = ">= 1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateadnan18746"
    container_name       = "tfstate"
    key                  = "lab.tfstate"
    use_oidc             = true
    use_azuread_auth     = true   # data-plane auth via RBAC, no storage keys
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}