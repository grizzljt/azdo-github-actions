data "azurerm_client_config" "current" {}
data "azurerm_subscription" "primary" {}

resource "azurerm_resource_group" "demo" {
  name     = "${var.environment}-${var.app_name}-rg"
  location = var.region_primary
}