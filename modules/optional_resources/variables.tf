# modules/optional_resources/variables.tf

variable "deploy_log_analytics_workspace" {
  description = "Set to true to deploy Log Analytics Workspaces (Prod and Non-Prod)"
  type        = bool
  default     = false
}

variable "deploy_automation_account" {
  description = "Set to true to deploy an Azure Automation Account"
  type        = bool
  default     = false
}

variable "deploy_data_collection_rules" {
  description = "Set to true to deploy Data Collection Rules"
  type        = bool
  default     = false
}

variable "deploy_managed_identity" {
  description = "Set to true to deploy a User Assigned Managed Identity"
  type        = bool
  default     = false
}

variable "location" {
  description = "Location for resource deployments"
  type        = string
}

variable "log_analytics_workspace_prod_name" {
  description = "Computed name for the production Log Analytics Workspace"
  type        = string
}

variable "log_analytics_workspace_nonprod_name" {
  description = "Computed name for the non-production Log Analytics Workspace"
  type        = string
}

variable "resource_prefix" {
  description = "Prefix for naming resources, used across resources for consistency"
  type        = string
}
