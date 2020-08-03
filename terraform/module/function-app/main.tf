resource "azurerm_app_service_plan" "module" {
  count               = var.app_service_plan_id == "" ? 1 : 0
  name                = "${var.function_app_name}-appsvc"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "FunctionApp"
  tags                = var.tags

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "module" {
  name                      = var.function_app_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  app_service_plan_id       = var.app_service_plan_id == "" ? azurerm_app_service_plan.module.0.id : var.app_service_plan_id
  storage_connection_string = var.storage_account_connection_string
  tags                      = var.tags

  # site_config {
  #   always_on                 = "${var.site_config_always_on}"
  #   use_32_bit_worker_process = "${var.site_config_use_32_bit_worker_process}"
  # }
  
  https_only = var.https_only
  version = "~2"

  identity {
    type = "SystemAssigned"
  }
}
