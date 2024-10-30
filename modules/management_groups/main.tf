# modules/management_groups/main.tf

resource "azurerm_management_group" "root" {
  name         = "${var.resource_prefix}-root"
  display_name = var.root_management_group_name
}

resource "azurerm_management_group" "decommissioned" {
  name         = "${var.resource_prefix}-decommissioned"
  display_name = var.decommissioned_group_name
  parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_management_group" "landing_zones" {
  name         = "${var.resource_prefix}-landingzones"
  display_name = var.landing_zones_group_name
  parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_management_group" "platform" {
  name         = "${var.resource_prefix}-platform"
  display_name = var.platform_group_name
  parent_management_group_id = azurerm_management_group.root.id
}

resource "azurerm_management_group" "sandboxes" {
  name         = "${var.resource_prefix}-sandboxes"
  display_name = var.sandboxes_group_name
  parent_management_group_id = azurerm_management_group.root.id
}

# Level 2 groups under Landing Zones
resource "azurerm_management_group" "prod" {
  name         = "${var.resource_prefix}-prod"
  display_name = var.prod_group_name
  parent_management_group_id = azurerm_management_group.landing_zones.id
}

resource "azurerm_management_group" "non_prod" {
  name         = "${var.resource_prefix}-nonprod"
  display_name = var.non_prod_group_name
  parent_management_group_id = azurerm_management_group.landing_zones.id
}

# Level 2 groups under Platform
resource "azurerm_management_group" "connectivity" {
  name         = "${var.resource_prefix}-connectivity"
  display_name = var.connectivity_group_name
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "identity" {
  name         = "${var.resource_prefix}-identity"
  display_name = var.identity_group_name
  parent_management_group_id = azurerm_management_group.platform.id
}

resource "azurerm_management_group" "management" {
  name         = "${var.resource_prefix}-management"
  display_name = var.management_group_name
  parent_management_group_id = azurerm_management_group.platform.id
}
