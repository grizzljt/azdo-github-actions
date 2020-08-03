variable "tags" {
  type        = map
  default     = {}
  description = "(Optional) Additional tags to apply."
}

variable "resource_group_name" {
  description = "The name of the resource group to create function app."
}

variable "location" {
  description = "The region to create function app."
}

variable "function_app_name" {
  description = "The name of the name of the function app."
}

variable "app_service_plan_id" {
  default     = ""
  description = "(Optional) Plan to create the function app within. If not passed one will be created."
}

variable "storage_account_connection_string" {
  description = "Storage Account connection string to use."
}

variable "site_config_always_on" {
  default     = "false"
  description = "(Optional)  Should the Function App be loaded at all times"
}

variable "site_config_use_32_bit_worker_process" {
  default     = "true"
  description = "(Optional) Should the Function App run in 32 bit mode, rather than 64 bit mode? "
}
variable "https_only" {
  default     = "true"
  description = "(Optional) Force HTTPS only"
}
variable "appsettings" {
  type        = map
  default     = {}
  description = "(Optional) App settings to initialize the app with "
}
