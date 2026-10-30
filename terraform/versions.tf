terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Documented remote state storage backend
  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-state"
  #   storage_account_name = "<storage_account_name>"
  #   container_name       = "tfstate"
  #   key                  = "aks-devsecops/dev.terraform.tfstate"
  #   use_oidc             = true
  # }
}
