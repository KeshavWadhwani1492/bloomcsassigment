variable "storage_account_name" {
  description = "The name of the Storage Account."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group in which to create the Storage Account."
  type        = string
}

variable "location" {
  description = "The location where the Storage Account should be created."
  type        = string
}
