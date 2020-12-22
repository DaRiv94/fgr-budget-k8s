# General purpose parameters
variable "client_secret" {
  type        = string
  description = "The password for this user"
}

variable "client_id" {
  type        = string
  description = "The user name"
}

variable "tenant_id" {
  type        = string
  description = "The identification for Microsoft AD"
}

variable "subscription_id" {
  type        = string
  description = "The subscription to which the configurations must be applied"
}

variable "environment" {
  type        = string
  description = "Target Environment"
  default     = "dev"
}

variable "location" {
  description = "Target Location"
  default     = "East US 2"
}



variable "resource_group_name" {
  description = "Resource group name"
  default     = "TF_ResGroup"
}