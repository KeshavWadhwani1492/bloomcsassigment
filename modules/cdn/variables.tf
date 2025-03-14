variable "cdn_profile_name" {
  description = "The name of the CDN Profile."
  type        = string
}

variable "cdn_endpoint_name" {
  description = "The name of the CDN Endpoint."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group in which to create the CDN."
  type        = string
}

variable "location" {
  description = "The location where the CDN should be created."
  type        = string
}

variable "origin_name" {
  description = "The name of the origin for the CDN."
  type        = string
}

variable "origin_host_name" {
  description = "The host name of the origin for the CDN."
  type        = string
}
