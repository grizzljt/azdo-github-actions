variable "subscription_id" { type = string }
variable "client_secret" { type = string }
variable "client_id" { type = string }
variable "tenant_id" { type = string }

variable "environment" {
  description = "The environment to which the Terraform configuration will be deployed"
  default     = "dev"
}

variable "app_name" {
  description = "The application to which the Terraform configuration is beholden"
  default     = "mastery"
}

variable "region_primary" {
  description = "The primary region to which the Terraform configuration is deployed"
  default     = "eastus2"
}

variable "tags" {
  description = "The default tags to be applied to infrastructure"
  default     = {}
}