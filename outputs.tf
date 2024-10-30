# outputs.tf

# Output the ID of the root management group
output "root_management_group_id" {
  description = "ID of the root management group"
  value       = module.management_groups.root_management_group_id
}

# Output the IDs of Level 1 management groups

output "decommissioned_group_id" {
  description = "ID of the Decommissioned management group"
  value       = module.management_groups.decommissioned_group_id
}

output "landing_zones_group_id" {
  description = "ID of the Landing Zones management group"
  value       = module.management_groups.landing_zones_group_id
}

output "platform_group_id" {
  description = "ID of the Platform management group"
  value       = module.management_groups.platform_group_id
}

output "sandboxes_group_id" {
  description = "ID of the Sandboxes management group"
  value       = module.management_groups.sandboxes_group_id
}

# Output the IDs of Level 2 management groups under Landing Zones

output "prod_group_id" {
  description = "ID of the Prod management group under Landing Zones"
  value       = module.management_groups.prod_group_id
}

output "non_prod_group_id" {
  description = "ID of the Non-Prod management group under Landing Zones"
  value       = module.management_groups.non_prod_group_id
}

# Output the IDs of Level 2 management groups under Platform

output "connectivity_group_id" {
  description = "ID of the Connectivity management group under Platform"
  value       = module.management_groups.connectivity_group_id
}

output "identity_group_id" {
  description = "ID of the Identity management group under Platform"
  value       = module.management_groups.identity_group_id
}

output "management_group_id" {
  description = "ID of the Management management group under Platform"
  value       = module.management_groups.management_group_id
}

# Optional outputs for subscriptions (only output if assigned)

output "connectivity_subscription_id" {
  description = "Subscription ID assigned to the Connectivity management group (if provided)"
  value       = var.connectivity_subscription_id
}

output "identity_subscription_id" {
  description = "Subscription ID assigned to the Identity management group (if provided)"
  value       = var.identity_subscription_id
}

output "management_subscription_id" {
  description = "Subscription ID assigned to the Management management group (if provided)"
  value       = var.management_subscription_id
}

output "management_resource_group_name" {
  value       = module.optional_resources.management_resource_group_name
  description = "Name of the resource group created in optional_resources"
}