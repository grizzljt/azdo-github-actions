terraform {
  backend "azurerm" {
  }
  required_version = ">= 0.12.28"
}

provider "azurerm" {
  version = "2.14"
  features {}
}

provider "random" {
  version = "2.3.0"
}

provider "azuredevops" {
  version               = ">= 0.0.1"
  org_service_url       = "https://kroger-rd.visualstudio.com"
  personal_access_token = var.devops_pat
}