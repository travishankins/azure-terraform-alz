# modules/management_groups/outputs.tf

output "root_management_group_id" {
  value = azurerm_management_group.root.id
}

output "decommissioned_group_id" {
  value = azurerm_management_group.decommissioned.id
}

output "landing_zones_group_id" {
  value = azurerm_management_group.landing_zones.id
}

output "platform_group_id" {
  value = azurerm_management_group.platform.id
}

output "sandboxes_group_id" {
  value = azurerm_management_group.sandboxes.id
}

output "prod_group_id" {
  value = azurerm_management_group.prod.id
}

output "non_prod_group_id" {
  value = azurerm_management_group.non_prod.id
}

output "connectivity_group_id" {
  value = azurerm_management_group.connectivity.id
}

output "identity_group_id" {
  value = azurerm_management_group.identity.id
}

output "management_group_id" {
  value = azurerm_management_group.management.id
}
