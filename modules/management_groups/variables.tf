# modules/management_groups/variables.tf

variable "resource_prefix" {
  description = "Prefix for naming resources, e.g., contoso"
  type        = string
}

variable "root_management_group_name" {
  description = "Root management group display name"
  type        = string
}

variable "decommissioned_group_name" {
  description = "Name for the Decommissioned management group"
  type        = string
}

variable "landing_zones_group_name" {
  description = "Name for the Landing Zones management group"
  type        = string
}

variable "platform_group_name" {
  description = "Name for the Platform management group"
  type        = string
}

variable "sandboxes_group_name" {
  description = "Name for the Sandboxes management group"
  type        = string
}

variable "prod_group_name" {
  description = "Name for the Prod management group under Landing Zones"
  type        = string
}

variable "non_prod_group_name" {
  description = "Name for the Non-Prod management group under Landing Zones"
  type        = string
}

variable "connectivity_group_name" {
  description = "Name for the Connectivity management group under Platform"
  type        = string
}

variable "identity_group_name" {
  description = "Name for the Identity management group under Platform"
  type        = string
}

variable "management_group_name" {
  description = "Name for the Management management group under Platform"
  type        = string
}

variable "connectivity_subscription_id" {
  description = "Optional subscription ID for the Connectivity group"
  type        = string
  default     = null
}

variable "identity_subscription_id" {
  description = "Optional subscription ID for the Identity group"
  type        = string
  default     = null
}

variable "management_subscription_id" {
  description = "Optional subscription ID for the Management group"
  type        = string
  default     = null
}
