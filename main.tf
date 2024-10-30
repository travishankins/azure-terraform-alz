# main.tf in root

terraform {
  backend "local" {}
}

provider "azurerm" {
  features {}
}

# Call the management groups module
module "management_groups" {
  source                       = "./modules/management_groups"
  resource_prefix              = var.resource_prefix
  root_management_group_name   = var.root_management_group_name
  decommissioned_group_name    = var.decommissioned_group_name
  landing_zones_group_name     = var.landing_zones_group_name
  platform_group_name          = var.platform_group_name
  sandboxes_group_name         = var.sandboxes_group_name
  prod_group_name              = var.prod_group_name
  non_prod_group_name          = var.non_prod_group_name
  connectivity_group_name      = var.connectivity_group_name
  identity_group_name          = var.identity_group_name
  management_group_name        = var.management_group_name

  # Optional subscription IDs for management groups
  connectivity_subscription_id = var.connectivity_subscription_id
  identity_subscription_id     = var.identity_subscription_id
  management_subscription_id   = var.management_subscription_id
}

# Call the optional resources module
module "optional_resources" {
  source                         = "./modules/optional_resources"
  deploy_log_analytics_workspace = var.deploy_log_analytics_workspace
  deploy_automation_account      = var.deploy_automation_account
  deploy_data_collection_rules   = var.deploy_data_collection_rules
  deploy_managed_identity        = var.deploy_managed_identity
  location                       = var.location

  # Pass Log Analytics workspace names from locals
  log_analytics_workspace_prod_name    = local.log_analytics_workspace_prod_name
  log_analytics_workspace_nonprod_name = local.log_analytics_workspace_nonprod_name
  resource_prefix                      = var.resource_prefix
}

# Calls the module for deploying a Virtual WAN with a Virtual Hub and ExpressRoute Gateway
module "vwan_with_vhub" {
  source                         = "Azure/avm-ptn-virtualwan/azurerm"
  version                        = "0.5.0"
  create_resource_group          = true
  resource_group_name            = local.vwan_resource_group_name
  location                       = var.location
  virtual_wan_name               = var.virtual_wan_name
  disable_vpn_encryption         = false
  allow_branch_to_branch_traffic = true
  type                           = "Standard"
  virtual_wan_tags               = var.tags

  virtual_hubs = {
    (local.virtual_hub_key) = {
      name           = local.virtual_hub_name
      location       = var.location
      resource_group = local.vwan_resource_group_name
      address_prefix = var.virtual_hub_address_prefix
      tags           = var.tags
    }
  }

  expressroute_gateways = {
    er-gateway = {
      name            = local.express_route_gateway_name
      virtual_hub_key = local.virtual_hub_key
      scale_units     = 1
    }
  }

  # Define empty er_circuit_connections if not needed
  er_circuit_connections = {}
}

# Azure Policy Module for CIS 2.0 Compliance in Audit Mode
module "azure_policy" {
  source               = "./modules/azure_policy"
  cis_policy_set_id    = "/providers/Microsoft.Authorization/policySetDefinitions/06f19060-9e68-4070-92ca-f15cc126059e"
  management_group_id  = module.management_groups.root_management_group_id
}
