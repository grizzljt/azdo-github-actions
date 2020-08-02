terraform {
  backend "azurerm" {
    storage_account_name = "terraformfilesgrizzle"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_msi              = true
    subscription_id = "acd2e298-d61f-4ed2-8b28-dc2f60d9f382"
    tenant_id       = "55a46e16-637a-4cfb-acaa-d89183887b16"
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