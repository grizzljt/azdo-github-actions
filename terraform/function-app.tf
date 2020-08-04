resource "azurerm_storage_account" "demo" {
  name                      = "${var.environment}${var.app_name}stgacc"
  resource_group_name       = azurerm_resource_group.demo.name
  location                  = azurerm_resource_group.demo.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
  tags                      = {}
  enable_https_traffic_only = "true"
}

resource "azurerm_advanced_threat_protection" "demo" {
  target_resource_id = azurerm_storage_account.demo.id
  enabled            = "true"
}

resource "azurerm_storage_container" "demo" {
  name                  = "${var.app_name}-blobs"
  storage_account_name  = azurerm_storage_account.demo.name
  container_access_type = "private"
}

module "function_app_listener" {
  source                            = "./module/function-app"
  resource_group_name               = azurerm_resource_group.demo.name
  location                          = azurerm_resource_group.demo.location
  tags                              = {}
  storage_account_connection_string = azurerm_storage_account.demo.primary_connection_string
  function_app_name                 = "${var.environment}-${var.app_name}-Event-Hub-Listener"

  appsettings = {
    mysetting  = "myvalue"
    mysetting2 = "myvalue2"
  }
}