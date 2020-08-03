resource "azurerm_servicebus_namespace" "demo" {
  name                = "${var.environment}-${var.app_name}-sbus-ns"
  location            = var.region_primary
  resource_group_name = azurerm_resource_group.demo.name
  sku                 = "Standard"

  tags = {
    source = "terraform"
  }
}

resource "azurerm_servicebus_queue" "demo" {
  name                = "${var.environment}-${var.app_name}-sbus"
  resource_group_name = azurerm_resource_group.demo.name
  namespace_name      = azurerm_servicebus_namespace.demo.name

  enable_partitioning = true
}

resource "azurerm_servicebus_queue_authorization_rule" "demo" {
  name                = "${var.environment}-${var.app_name}-owner-sbus-rule"
  namespace_name      = azurerm_servicebus_namespace.demo.name
  queue_name          = azurerm_servicebus_queue.demo.name
  resource_group_name = azurerm_resource_group.demo.name

  listen = true
  send   = true
  manage = true
}