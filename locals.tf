# locals.tf

locals {
  # Resource Group Name for Virtual WAN resources
  vwan_resource_group_name = "${var.resource_prefix}-vwan-rg"

  # Virtual WAN and Hub Names
  express_route_gateway_name = "eg-${var.org_name}-vwan"
  virtual_hub_name           = "vhub-${var.org_name}-vwan"
  virtual_wan_name           = var.virtual_wan_name != "" ? var.virtual_wan_name : "${var.org_name}-vwan"
  virtual_hub_key            = "${var.org_name}-vhub"

  # Default Log Analytics Workspace Names
  log_analytics_workspace_prod_name    = "law-${var.org_name}-prod"
  log_analytics_workspace_nonprod_name = "law-${var.org_name}-nonprod"
}
