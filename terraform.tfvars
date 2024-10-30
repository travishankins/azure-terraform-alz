# terraform.tfvars

# Name of the root management group
root_management_group_name = "ALZ Root"

# Prefix for naming resources (used in management group names and resource names)
resource_prefix = "contoso"

# Location for resource deployments (Azure region)
location = "westcentralus"

# Optional subscription IDs for specific management groups
# Replace these with actual subscription IDs or leave as null if not needed
connectivity_subscription_id = ""
identity_subscription_id     = ""
management_subscription_id   = ""

# Custom names for the top-level and secondary management groups
decommissioned_group_name = "Decommissioned"
landing_zones_group_name  = "Landing Zones"
platform_group_name       = "Platform"
sandboxes_group_name      = "Sandbox"

# Custom names for management groups under Landing Zones
prod_group_name     = "Prod"
non_prod_group_name = "Non-Prod"

# Custom names for management groups under Platform
connectivity_group_name = "Connectivity"
identity_group_name     = "Identity"
management_group_name   = "Management"

# Organization name for consistent naming
org_name = "contoso"

# Flags to deploy optional resources
deploy_log_analytics_workspace = true
deploy_automation_account      = true
deploy_resource_group          = true
deploy_data_collection_rules   = false
deploy_managed_identity        = false

# Virtual WAN and Hub Variables
virtual_wan_name           = "contoso-vwan"
virtual_hub_address_prefix = "10.0.0.0/24"

# Tags for resources
tags = {
  environment = "production"
  deployment  = "test"
}
