# Root-level variables.tf

# Management Group Variables
variable "root_management_group_name" {
  description = "Display name of the root management group under the tenant root group"
  type        = string
}

# Prefix for naming resources, used to maintain naming consistency across resources
variable "resource_prefix" {
  description = "Prefix for resource names (e.g., contoso)"
  type        = string
}

# Location for resource deployments, specifying the Azure region (e.g., West US)
variable "location" {
  description = "Location for resources (e.g., West US)"
  type        = string
}

# Optional subscription IDs for management groups, nullable if no subscription to assign
variable "connectivity_subscription_id" {
  description = "Subscription ID to assign to the Connectivity management group (optional)"
  type        = string
  default     = null
}

variable "identity_subscription_id" {
  description = "Subscription ID to assign to the Identity management group (optional)"
  type        = string
  default     = null
}

variable "management_subscription_id" {
  description = "Subscription ID to assign to the Management management group (optional)"
  type        = string
  default     = null
}

# Names for primary management groups under the root group
variable "decommissioned_group_name" {
  description = "Name for the Decommissioned management group"
  type        = string
  default     = "Decommissioned"
}

variable "landing_zones_group_name" {
  description = "Name for the Landing Zones management group"
  type        = string
  default     = "Landing Zones"
}

variable "platform_group_name" {
  description = "Name for the Platform management group"
  type        = string
  default     = "Platform"
}

variable "sandboxes_group_name" {
  description = "Name for the Sandboxes management group"
  type        = string
  default     = "Sandbox"
}

# Names for sub-groups under Landing Zones
variable "prod_group_name" {
  description = "Name for the Prod management group under Landing Zones"
  type        = string
  default     = "Prod"
}

variable "non_prod_group_name" {
  description = "Name for the Non-Prod management group under Landing Zones"
  type        = string
  default     = "Non-Prod"
}

# Names for sub-groups under Platform
variable "connectivity_group_name" {
  description = "Name for the Connectivity management group under Platform"
  type        = string
  default     = "Connectivity"
}

variable "identity_group_name" {
  description = "Name for the Identity management group under Platform"
  type        = string
  default     = "Identity"
}

variable "management_group_name" {
  description = "Name for the Management management group under Platform"
  type        = string
  default     = "Management"
}

# Additional Variables for Optional Resource Deployments

# Organization name for consistent naming
variable "org_name" {
  description = "The name of the organization, used in naming resources like Log Analytics Workspaces, Virtual WAN, etc."
  type        = string
}

# Option to deploy Log Analytics Workspaces
variable "deploy_log_analytics_workspace" {
  description = "Set to true to deploy Log Analytics Workspaces (Prod and Non-Prod)"
  type        = bool
  default     = true
}

# Option to deploy an Azure Automation Account
variable "deploy_automation_account" {
  description = "Set to true to deploy an Azure Automation Account"
  type        = bool
  default     = false
}

# Option to deploy an additional Azure Resource Group
variable "deploy_resource_group" {
  description = "Set to true to deploy an Azure Resource Group"
  type        = bool
  default     = false
}

# Option to deploy Data Collection Rules
variable "deploy_data_collection_rules" {
  description = "Set to true to deploy Data Collection Rules"
  type        = bool
  default     = false
}

# Option to deploy a User Assigned Managed Identity
variable "deploy_managed_identity" {
  description = "Set to true to deploy a User Assigned Managed Identity"
  type        = bool
  default     = false
}

# Tags for resources
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    environment = "production"
    deployment  = "test"
  }
}

# Virtual WAN and Hub Variables

# Name for the virtual WAN
variable "virtual_wan_name" {
  description = "The name of the Virtual WAN"
  type        = string
  default     = "default-vwan-name"
}

# Virtual hub address prefix
variable "virtual_hub_address_prefix" {
  description = "CIDR range for the virtual hub's address prefix"
  type        = string
  default     = "10.0.0.0/24"
}
