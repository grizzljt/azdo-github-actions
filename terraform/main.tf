# data "azurerm_client_config" "current" {}
# data "azurerm_subscription" "primary" {}

resource "azurerm_resource_group" "demo" {
  name     = "${var.environment}-${var.app_name}-rg"
  location = var.region_primary
}

resource "azurerm_container_registry" "demo-acr" {
  name                     = "demo-acr"
  resource_group_name      = azurerm_resource_group.demo.name
  location                 = azurerm_resource_group.demo.location
  sku                      = "Premium"
  admin_enabled            = true
}