# modules/azure_policy/outputs.tf

output "cis_2_0_policy_assignment_id" {
  description = "The ID of the CIS 2.0 policy assignment in audit mode"
  value       = azurerm_management_group_policy_assignment.cis_2_0_audit.id
}

output "cis_2_0_policy_assignment_name" {
  description = "The name of the CIS 2.0 policy assignment in audit mode"
  value       = azurerm_management_group_policy_assignment.cis_2_0_audit.name
}
