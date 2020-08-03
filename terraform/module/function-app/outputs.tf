output "id" {
  description = "The Function App ID."
  value       = azurerm_function_app.module.id
}

output "hostname" {
  description = "The hostname of the funciton."
  value       =  azurerm_function_app.module.default_hostname
}

output "app_service_plan_id" {
  description = "The app service plan id of the funciton."
  value       = "${var.app_service_plan_id == "" ? azurerm_app_service_plan.module.0.id : var.app_service_plan_id}"
}

output "identity_principal_id" {
  description = "The managed identity of the function"
  value       = azurerm_function_app.module.identity[0].principal_id
}
