# main.tf in azure_policy module

provider "azurerm" {
  features {}
}

# CIS 2.0 Policy Assignment with required parameters
resource "azurerm_management_group_policy_assignment" "cis_2_0_audit" {
  name                 = "CIS_2_0_Audit_Assignment"
  display_name         = "CIS 2.0 Audit Assignment"
  policy_definition_id = var.cis_policy_set_id
  management_group_id  = var.management_group_id

  # Required parameter for CIS compliance
  parameters = jsonencode({
    "maximumDaysToRotate-d8cf8476-a2ec-4916-896e-992351803c44" = {
      "value" = var.maximum_days_to_rotate
    }
  })

}

# Uncomment and modify to add additional policy assignments in the future
# resource "azurerm_management_group_policy_assignment" "additional_policy" {
#   name                 = var.additional_policy_assignment_name
#   display_name         = "Additional Policy Assignment"
#   policy_definition_id = var.additional_policy_id
#   management_group_id  = var.management_group_id
#   parameters           = var.additional_policy_parameters  # Define in variables.tf if needed
#
#   tags = var.policy_tags
# }
